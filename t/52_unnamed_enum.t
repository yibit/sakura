
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test unnamed enum
--- src

#include <stdio.h>

enum fred { a, b, c };

int main()
{
   printf("a=%d\n", a);
   printf("b=%d\n", b);
   printf("c=%d\n", c);

   enum fred d;

   typedef enum { e, f, g } h;
   typedef enum { i, j, k } m;

   printf("e=%d\n", e);
   printf("f=%d\n", f);
   printf("g=%d\n", g);

   printf("i=%d\n", i);
   printf("j=%d\n", j);
   printf("k=%d\n", k);

   return 0;
}

--- args
--- out
a=0
b=1
c=2
e=0
f=1
g=2
i=0
j=1
k=2
--- err

