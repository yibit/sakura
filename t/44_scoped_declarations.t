
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test scoped declarations
--- src

#include <stdio.h>

int main()
{
   int a;

   for (a = 0; a < 2; a++)
   {
      int b = a;
   }

   printf("it's all good\n");

   return 0;
}

--- args
--- out
it's all good
--- err

