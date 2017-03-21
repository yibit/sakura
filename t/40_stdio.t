
# vi: ft= et tw=4 sw=4

use lib 't/lib';
#use Test::Sakura 'no_plan';
use Test::Sakura skip_all => 'Skip on Darwin';

run_tests();

__DATA__


=== TEST 1: test stdio
--- src
#include <stdio.h>

int main()
{
   FILE *f = fopen("fred.txt", "w");
   fwrite("hello\nhello\n", 1, 12, f);
   fclose(f);

   char freddy[7];
   f = fopen("fred.txt", "r");
   if (fread(freddy, 1, 6, f) != 6)
      printf("couldn't read fred.txt\n");

   freddy[6] = '\0';
   fclose(f);

   printf("%s", freddy);

   int InChar;
   char ShowChar;
   f = fopen("fred.txt", "r");
   while ( (InChar = fgetc(f)) != EOF)
   {
      ShowChar = InChar;
      if (ShowChar < ' ')
         ShowChar = '.';

      printf("ch: %d '%c'\n", InChar, ShowChar);
   }
   fclose(f);

   f = fopen("fred.txt", "r");
   while ( (InChar = getc(f)) != EOF)
   {
      ShowChar = InChar;
      if (ShowChar < ' ')
         ShowChar = '.';

      printf("ch: %d '%c'\n", InChar, ShowChar);
   }
   fclose(f);

   f = fopen("fred.txt", "r");
   while (fgets(freddy, sizeof(freddy), f) != NULL)
      printf("x: %s", freddy);

   fclose(f);

   return 0;
}

--- args
--- out
hello
ch: 104 'h'
ch: 101 'e'
ch: 108 'l'
ch: 108 'l'
ch: 111 'o'
ch: 10 '.'
ch: 104 'h'
ch: 101 'e'
ch: 108 'l'
ch: 108 'l'
ch: 111 'o'
ch: 10 '.'
ch: 104 'h'
ch: 101 'e'
ch: 108 'l'
ch: 108 'l'
ch: 111 'o'
ch: 10 '.'
ch: 104 'h'
ch: 101 'e'
ch: 108 'l'
ch: 108 'l'
ch: 111 'o'
ch: 10 '.'
x: hello
x: hello
--- err

