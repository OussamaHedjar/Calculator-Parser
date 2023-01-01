%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void);
int yyerror(char* s);
#include "calculator.tab.h"
%}


%%
"print"     {return print;}
"exit"      {return exit_command;}
"add"       {return add;}
"sub"       {return sub;}
"mul"       {return mul;}
"div"       {return divison;}
"pop"       {return pop;}
"push"      {return push;}
[0-9]+      {yylval.num = atoi(yytext); return number;}
[ \t\n]     {;}
.           {ECHO; yyerror(" unexpected input");}

%%
int yywrap (void) {return -1;}

