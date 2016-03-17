
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test nested break
--- src

#include <stdio.h>

int main()
{
   int a;
   char b;

   a = 0;
   while (a < 2)
   {
      printf("%d", a++);
      break;

      b = 'A';
      while (b < 'C')
      {
         printf("%c", b++);
      }
      printf("e");
   }
   printf("\n");

   return 0;
}

--- args
--- out
0
--- err

