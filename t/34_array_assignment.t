
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test arrag assignment
--- src

#include <stdio.h>

int main()
{
   int a[4];

   a[0] = 12;
   a[1] = 23;
   a[2] = 34;
   a[3] = 45;

   printf("%d %d %d %d\n", a[0], a[1], a[2], a[3]);

   int b[4];

   b = a;

   printf("%d %d %d %d\n", b[0], b[1], b[2], b[3]);

   return 0;
}

--- args
--- out
12 23 34 45
12 23 34 45
--- err

