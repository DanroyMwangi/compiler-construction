%{
#include <stdio.h>
int wordCount = 0; // Initialize the count of words to zero
%}

%%

[a-zA-Z]+    { 
    printf("%s\n", yytext);  // Print each word on a new line
    wordCount++; // Increment count for each word
}  
[ \t\n]+     { /* ignore whitespace */ }  // Ignore whitespace
.            { /* ignore other characters */ } // Ignore other characters

%%

int yywrap() { return 1; }  // Required for some older versions of Lex

int main(){

    // Uncomment the lines below
    // to take input from a file
    // FILE *fp;
    // char filename[50];
    // printf("Enter the filename: \n");
    // scanf("%s",filename);
    // fp = fopen(filename,"r");
    // yyin = fp;

    yylex(); // Run the lexical analyzer
    printf("\nTotal words are: %d\n", wordCount);  // Print the count of words
    return 0;
}
