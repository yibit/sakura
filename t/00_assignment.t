
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test assignment
--- src

#include <stdio.h>

int main() 
{
   int a;
   a = 42;
   printf("%d\n", a);

   int b = 64;
   printf("%d\n", b);

   int c = 12, d = 34;
   printf("%d, %d\n", c, d);

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
42
64
12, 34
--- err
