
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test while
--- src

#include <stdio.h>

int main()
{
   int a;
   int p;
   int t;

   a = 1;
   p = 0;
   t = 0;

   while (a < 100)
   {
      printf("%d\n", a);
      t = a;
      a = t + p;
      p = t;
   }

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
1
1
2
3
5
8
13
21
34
55
89
--- err

