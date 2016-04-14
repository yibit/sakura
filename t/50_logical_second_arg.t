
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test logicak second arg
--- src

#include <stdio.h>

int fred()
{
   printf("fred\n");
   return 0;
}

int joe()
{
   printf("joe\n");
   return 1;
}

int main()
{
   printf("%d\n", fred() && joe());
   printf("%d\n", fred() || joe());
   printf("%d\n", joe() && fred());
   printf("%d\n", joe() || fred());
   printf("%d\n", fred() && (1 + joe()));
   printf("%d\n", fred() || (0 + joe()));
   printf("%d\n", joe() && (0 + fred()));
   printf("%d\n", joe() || (1 + fred()));

   return 0;
}

--- args
--- out
fred
0
fred
joe
1
joe
fred
0
joe
1
fred
0
fred
joe
1
joe
fred
0
joe
1
--- err

