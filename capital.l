/**
LAB ASSIGNMENT 1: Design a simple script that takes an English sentence(s) (either static or dynamic) and outputs the individual words. E.g. An input can be "He is a smart student". The output will be individual words "He", "is", "a", "smart" and "student". Each word on its own line.
**/
%%
[a-zA-Z]+   { printf("%s\n", yytext); }
[ \t]+      { /* To ignore any whitespaces */ }
\n          { /* To ignore newlines */ }
.           { /* To ignore other characters */ }
%%
 

int yywrap(){}
int main(){
yylex();

 
return 0;
}