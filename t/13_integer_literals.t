
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test interger literals
--- src

#include <stdio.h>

int main()
{
   int a = 24680;
   int b = 01234567;
   int c = 0x2468ac;
   int d = 0x2468AC;
   int e = 0b010101010101;

   printf("%d\n", a);
   printf("%d\n", b);
   printf("%d\n", c);
   printf("%d\n", d);
   printf("%d\n", e);

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
24680
342391
2386092
2386092
1365
--- err

