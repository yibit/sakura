
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test goto
--- src

#include <stdio.h>

void fred()
{
   printf("In fred()\n");
   goto done;
   printf("In middle\n");
done:
   printf("At end\n");
}

void joe()
{
   int b = 5678;

   printf("In joe()\n");

   {
      int c = 1234;
      printf("c = %d\n", c);
      goto outer;
      printf("uh-oh\n");
   }

outer:    

   printf("done\n");
}

void henry()
{
   int a;

   printf("In henry()\n");
   goto inner;

   {
      int b;
inner:    
      b = 1234;
      printf("b = %d\n", b);
   }

   printf("done\n");
}

int main()
{
   fred();
   joe();
   henry();

   return 0;
}

--- args
--- out
In fred()
At end
In joe()
c = 1234
done
In henry()
b = 1234
done
--- err

