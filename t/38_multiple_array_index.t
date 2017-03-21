
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test multiple array index
--- src

#include <stdio.h>

int main()
{
   int a[4][4];
   int b = 0;
   int x;
   int y;

   for (x = 0; x < 4; x++)
   {
      for (y = 0; y < 4; y++)
      {
         b++;
         a[x][y] = b;
      }
   }

   for (x = 0; x < 4; x++)
   {
      printf("x=%d: ", x);
      for (y = 0; y < 4; y++)
      {
         printf("%d ", a[x][y]);
      }
      printf("\n");
   }

   return 0;
}

--- args
--- out
x=0: 1 2 3 4 
x=1: 5 6 7 8 
x=2: 9 10 11 12 
x=3: 13 14 15 16 
--- err

