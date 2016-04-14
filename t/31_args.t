
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test args
--- src

#include <stdio.h>

int main(int argc, char **argv)
{
   int Count;

   printf("hello world %d\n", argc);
   for (Count = 0; Count < argc; Count++)
      printf("arg %d: %s\n", Count, argv[Count]);

   return 0;
}

--- args
arg1 arg2 arg3 arg4
--- out
hello world 6
arg 0: 31_args.c
arg 1: -
arg 2: arg1
arg 3: arg2
arg 4: arg3
arg 5: arg4
--- err

