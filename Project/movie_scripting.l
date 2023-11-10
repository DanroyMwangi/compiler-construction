%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int scene_count = 0;
int character_count = 0;
int action_count = 0;
int dialogue_count = 0;

void report_error(const char* message) {
    fprintf(stderr, "Error: %s\n", message);
}

/* Token definitions */
#define SCENE 1
#define CHARACTER 2
#define ACTION 3
#define SAYS 4
#define DIALOGUE 5

/* Structure to hold data associated with tokens */
typedef struct {
    char* str;
} YYSTYPE;

YYSTYPE yylval;

%}

/* Flex options can go here. */
%option noyywrap

%%

\[Scene:      { return SCENE; }
\[Character:  { return CHARACTER; }
\[Action:     { return ACTION; }
Says          { return SAYS; }
\"[^\"]*\"    { yylval.str = strdup(yytext); return DIALOGUE; }
[ \t\n]+      { /* Ignore whitespace. */ }
.             { /* Catch all for any other characters. */ }

%%

int main() {
    yylex();
    
    if (scene_count == 0) {
        report_error("Script must contain at least one scene.");
        return 1;
    }
    
    if (scene_count != character_count || scene_count != action_count) {
        report_error("Number of scenes, characters, and actions must match.");
        return 1;
    }
    
    if (dialogue_count > 0 && dialogue_count != character_count) {
        report_error("Number of dialogues must match the number of characters.");
        return 1;
    }
    
    printf("Script is valid.\n");
    return 0;
}
