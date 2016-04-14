
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test include
--- src

#include <stdio.h>

int main()
{
   printf("including\n");
#include "18_include.h"
   printf("done\n");

   return 0;
}

/* vim: set expandtab ts=4 sw=3 sts=3 tw=80 :*/

--- args
--- out
including
included
done
--- err

