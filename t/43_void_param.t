
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test void param
--- src

#include <stdio.h>

void fred(void)
{
   printf("yo\n");
}

int main()
{
   fred();

   return 0;
}

--- args
--- out
yo
--- err

