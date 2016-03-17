
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test array address
--- src

#include <stdio.h>
#include <string.h>

int main()
{
   char a[10];
   strcpy(a, "abcdef");
   printf("%s\n", &a[1]);

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/

--- args
--- out
bcdef
--- err

