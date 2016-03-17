
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test for
--- src

#include <stdio.h>

int main() 
{
   int Count;

   for (Count = 1; Count <= 10; Count++)
   {
      printf("%d\n", Count);
   }

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

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

