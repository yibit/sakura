
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test sizeof case 2
--- src

#include <stdio.h>

int main()
{
   char a;
   short b;

   printf("%d %d\n", sizeof(char), sizeof(a));
   printf("%d %d\n", sizeof(short), sizeof(b));

   return 0;
}

--- args
--- out
1 1
2 2
--- err

