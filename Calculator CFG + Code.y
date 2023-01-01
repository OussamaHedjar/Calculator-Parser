%{
void yyerror(char *s);
int yylex(void);
#include <stdio.h>
#include <stdlib.h>
int stack[10];
int size = 10;
int* Push(int n);
void Pop();
int* Addition();
int* Subtraction();
int* Division();
int* Multiplication();
void Print();
%}

%union{int num; int * crts; char * string;}
%token <crts> push
%token <crts> add
%token <crts> sub
%token <crts> mul
%token <crts> divison
%token <num> pop
%token <num> number
%type <string> S P
%token print
%token exit_command

%%

P : S  P            
  | S                 
  ;

S : print               {Print();}
  | exit_command        {exit(EXIT_SUCCESS);}
  | push number         {Push($2);}
  | add                 {Addition();}
  | sub                 {Subtraction();}
  | mul                 {Multiplication();}
  | divison             {Division();}
  | pop                 {Pop();}
  ;

%%

int* Push(int n){
    int temp = 0;
        if(stack[0] != 0){
             for(int i = size - 1 ; i > 0; i--){
                 stack[i] = stack[i - 1]; 
             }
            stack[0] = n;
            
        }
        else if(stack[0] == 0){
            stack[0] = n;
        }
    
    return stack;
}

int* Addition(){
    int temp = stack[0] + stack[1];
    // we pop by left shift
    for(int i = 0; i < size; i++)  
                stack[i] = stack[i + 1];
    stack[0] = temp;
    
    return stack;
}

int* Subtraction(){
    int temp = stack[0] - stack[1];
    // we pop by left shift
    for(int i = 0; i < size; i++)  
                stack[i] = stack[i + 1];
    stack[0] = temp;
    
    return stack;
}

int* Multiplication(){
    int temp = stack[0] * stack[1];
    // we pop by left shift
    for(int i = 0; i < size; i++)  
                stack[i] = stack[i + 1];
    stack[0] = temp;
    
    return stack;
}

int* Division(){
    int temp = stack[0] / stack[1];
    // we pop by left shift
    for(int i = 0; i < size; i++)  
                stack[i] = stack[i + 1];
    stack[0] = temp;
    
    return stack;
}

void Pop(){
    int temp = stack[0];
    for(int i = 0; i < size; i++)  
                stack[i] = stack[i + 1];
                
    printf("popped element: %d ", temp);
}   

void Print(){
    printf("%d", stack[0]);
}

void yyerror (char *s) {
   fprintf (stderr, "%s\n", s);
 }
 
int main(void){
  for(int i = 0; i < size; i++){
  	stack[i] = 0;
  }
	return yyparse();
	
}
