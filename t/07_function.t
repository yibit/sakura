
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test function
--- src

#include <stdio.h>

int myfunc(int x)
{
   return x * x;
}

void vfunc(int a)
{
   printf("a=%d\n", a);
}

void qfunc()
{
   printf("qfunc()\n");
}

int main()
{
   printf("%d\n", myfunc(3));
   printf("%d\n", myfunc(4));

   vfunc(1234);

   qfunc();

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
9
16
a=1234
qfunc()
--- err

