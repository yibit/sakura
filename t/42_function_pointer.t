
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test function pointer
--- src

#include <stdio.h>

int fred(int p)
{
   printf("yo %d\n", p);
   return 42;
}

int (*f)(int) = &fred;

int main()
{
   printf("%d\n", (*f)(24));

   return 0;
}

--- args
--- out
yo 24
42
--- err

