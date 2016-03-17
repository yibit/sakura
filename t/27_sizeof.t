
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test sizeof
--- src

#include <stdio.h>

int main()
{
   char a;
   int b;
   double c;

   printf("%d\n", sizeof(a));
   printf("%d\n", sizeof(b));
   printf("%d\n", sizeof(c));

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/

--- args
--- out
1
4
8
--- err

