
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::Sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test sprintf
--- src

#include <stdio.h>

int main()
{
   char Buf[100];
   int Count;

   for (Count = 1; Count <= 20; Count++)
   {
      sprintf(Buf, "->%02d<-\n", Count);
      printf("%s", Buf);
   }

   return 0;
}

--- args
--- out
->01<-
->02<-
->03<-
->04<-
->05<-
->06<-
->07<-
->08<-
->09<-
->10<-
->11<-
->12<-
->13<-
->14<-
->15<-
->16<-
->17<-
->18<-
->19<-
->20<-
--- err

