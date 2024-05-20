%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[a-zA-Z]+ return VARIABLE;
[0-9]+ return NUMBER;
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}
  
validexp.y:

 %{
    #include<stdio.h>
%}
%token NUMBER
%token VARIABLE

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%

S: VARIABLE'='E {
       printf("\nEntered arithmetic expression is Valid\n\n");
       return 0;
     }
E:E'+'E 
 |E'-'E 
 |E'*'E 
 |E'/'E 
 |E'%'E 
 |'('E')' 
 | NUMBER 
 | VARIABLE
;
%%
void main()
{ 
   printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication, Divison, Modulus and Round brackets:\n");
   yyparse();
}
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
}


