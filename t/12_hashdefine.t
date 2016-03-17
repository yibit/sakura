
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test define
--- src

#include <stdio.h>

#define FRED 12
#define BLOGGS(x) (12*(x))

int main()
{
   printf("%d\n", FRED);
   printf("%d, %d, %d\n", BLOGGS(1), BLOGGS(2), BLOGGS(3));

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
12
12, 24, 36
--- err

