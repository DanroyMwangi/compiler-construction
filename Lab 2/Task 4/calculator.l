
%{
#include "y.tab.h"
%}

DIGIT   [0-9]
%%
{DIGIT}+ {
    yylval = atoi(yytext);
    return NUM;
}
[-+*/\(\)\n] {
    return yytext[0];
}
[ \t] ; // Skip whitespace
. ;
%%
int yywrap() {
    return 1;
}
