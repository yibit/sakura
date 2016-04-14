
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test character constants
--- src

#include <stdio.h>

int main()
{
   printf("%d\n", '\1');
   printf("%d\n", '\10');
   printf("%d\n", '\100');
   printf("%d\n", '\x01');
   printf("%d\n", '\x0e');
   printf("%d\n", '\x10');
   printf("%d\n", '\x40');
   printf("test \x40\n");

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/

--- args
--- out
1
8
64
1
14
16
64
test @
--- err

