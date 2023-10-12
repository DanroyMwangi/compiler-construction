%{
#include <stdio.h>
int yylex();
void yyerror(const char* s);
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%
calc:   /* empty */
        | calc expr '\n' { printf("Result: %d\n", $2); }
        ;

expr:   NUM
        | expr '+' expr { $$ = $1 + $3; }
        | expr '-' expr { $$ = $1 - $3; }
        | expr '*' expr { $$ = $1 * $3; }
        | expr '/' expr { $$ = $1 / $3; }
        | '(' expr ')'   { $$ = $2; }
        ;

%%
void yyerror(const char* s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
