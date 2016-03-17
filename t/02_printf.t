
# vi: ft= et tw=4 sw=4

use lib 't/lib';
use Test::sakura 'no_plan';

run_tests();

__DATA__


=== TEST 1: test printf
--- src

#include <stdio.h>

int main() 
{
   printf("Hello world\n");

   int Count;
   for (Count = -5; Count <= 5; Count++)
      printf("Count = %d\n", Count);

   printf("String 'hello', 'there' is '%s', '%s'\n", "hello", "there");
   printf("Character 'A' is '%c'\n", 65);
   printf("Character 'a' is '%c'\n", 'a');

   return 0;
}

// vim: set expandtab ts=4 sw=3 sts=3 tw=80 :

--- args
--- out
Hello world
Count = -5
Count = -4
Count = -3
Count = -2
Count = -1
Count = 0
Count = 1
Count = 2
Count = 3
Count = 4
Count = 5
String 'hello', 'there' is 'hello', 'there'
Character 'A' is 'A'
Character 'a' is 'a'
--- err
