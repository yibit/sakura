
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test array initialisers
--- src

#include <stdio.h>

int main()
{
   int Count;

   int Array[10] = { 12, 34, 56, 78, 90, 123, 456, 789, 8642, 9753 };

   for (Count = 0; Count < 10; Count++)
      printf("%d: %d\n", Count, Array[Count]);

   int Array2[10] = { 12, 34, 56, 78, 90, 123, 456, 789, 8642, 9753, };

   for (Count = 0; Count < 10; Count++)
      printf("%d: %d\n", Count, Array2[Count]);


   return 0;
}

--- args
--- out
0: 12
1: 34
2: 56
3: 78
4: 90
5: 123
6: 456
7: 789
8: 8642
9: 9753
0: 12
1: 34
2: 56
3: 78
4: 90
5: 123
6: 456
7: 789
8: 8642
9: 9753
--- err

