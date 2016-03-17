
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test static
--- src

#include <stdio.h>

static int fred = 1234;
static int joe;

void henry()
{
   static int fred = 4567;

   printf("%d\n", fred);
   fred++;
}

int main()
{
   printf("%d\n", fred);
   henry();
   henry();
   henry();
   henry();
   printf("%d\n", fred);
   fred = 8901;
   joe = 2345;
   printf("%d\n", fred);
   printf("%d\n", joe);

   return 0;
}

--- args
--- out
1234
4567
4568
4569
4570
1234
8901
2345
--- err

