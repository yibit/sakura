
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test bracket evaluation
--- src

#include <stdio.h>

struct point
{
   double x;
   double y;
};

struct point point_array[100];

int main()
{
   int my_point = 10;

   point_array[my_point].x = 12.34;
   point_array[my_point].y = 56.78;

   printf("%f, %f\n", point_array[my_point].x, point_array[my_point].y);

   return 0;
}

--- args
--- out
12.340000, 56.780000
--- err

