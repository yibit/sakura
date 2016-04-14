
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test if
--- src

#include <stdio.h>

int main()
{
   int a = 1;

   if (a)
      printf("a is true\n");
   else
      printf("a is false\n");

   int b = 0;
   if (b)
      printf("b is true\n");
   else
      printf("b is false\n");

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
a is true
b is false
--- err

