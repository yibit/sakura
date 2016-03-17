
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test empty for
--- src

#include <stdio.h>

int main()
{
   int Count = 0;

   for (;;)
   {
      Count++;
      printf("%d\n", Count);
      if (Count >= 10)
         break;
   }

   return 0;
}

--- args
--- out
1
2
3
4
5
6
7
8
9
10
--- err

