
%{
#include <stdio.h>
#include <math.h>

#include "interprete.h"

#include "macros.h"

#define code2(c1,c2)         code(c1); code(c2)
#define code3(c1,c2,c3)      code(c1); code(c2); code(c3)
%}

%union{             
       Symbol *sym;    /* puntero a la tabla de simbolos */
       Inst *inst;     /* instruccion de maquina */
}

/* Definiciones regulares */
%token <sym> NUMBER VAR CONSTANTE FUNCION0_PREDEFINIDA FUNCION1_PREDEFINIDA FUNCION2_PREDEFINIDA INDEFINIDA MIENTRAS SI ENTONCES SI_NO LEER LEER_CADENA ESCRIBIR ESCRIBIR_CADENA HACER FIN_MIENTRAS REPETIR PARA DESDE HASTA PASO FIN_PARA

%type <inst> stmt asgn expr stmtlist cond while if end para

%right ASIGNACION
%left O_LOGICO
%left Y_LOGICO
%left NO_LOGICO
%left MAYOR_QUE MENOR_QUE MENOR_IGUAL MAYOR_IGUAL DISTINTO IGUAL
%left '+' '-'
%left '*' MOD DIV DIV_ENT
%left UNARIO _NO
%right POTENCIA
%%

list :    /* nada: epsilon produccion */ 
        | list stmt  ';' {code(STOP); return 1;}
        | list error ';'   {yyerrok;} 
        ;

stmt :    /* nada: epsilon produccion */  {$$=progp;}
        | asgn          {code(pop2);}
	   | PRINT expr    {code(escribir); $$ = $2;}
        | LEER '(' VAR ')'    {code2(leervariable,(Inst)$3);}
        | LEER_CADENA '(' VAR ')' {code2(leercadena,(Inst)$3);}
        | ESCRIBIR '(' expr ')'    {code(escribir); $$ = $3;}
        | ESCRIBIR_CADENA '(' expr ')'   {code(escribircadena); $$ = $3;}
        | mientras cond HACER stmtlist FIN_MIENTRAS end  
                  {
                   ($1)[1]=(Inst)$3; /* cuerpo del bucle */
                   ($1)[2]=(Inst)$4; /* siguiente instruccion al bucle */
                  }
        | si cond ENTONCES end /* proposicion if sin parte else */
                  {
                   ($1)[1]=(Inst)$3; /* cuerpo del if */
                   ($1)[3]=(Inst)$4; /* siguiente instruccion al if */
                  }
        | si cond ENTONCES end SI_NO stmt end /* proposicion if con parte else */
                  {
                   ($1)[1]=(Inst)$3; /* cuerpo del if */
                   ($1)[2]=(Inst)$6; /* cuerpo del else */
                   ($1)[3]=(Inst)$7; /* siguiente instruccion al if-else */
                  }
        | '{' stmtlist '}'  {$$ = $2;}

        | para variable DESDE expr end HASTA expr end PASO expr end HACER stmlist FIN_PARA  end
        {
            ($1)[1] = (Inst) ; /* Desde */
            ($1)[2] = (Inst) ; /* hasta */
            ($1)[3] = (Inst) ; /* paso */
            ($1)[4] = (Inst) ; /* cuerpo for */
            ($1)[5] = (Inst) ; /* Siguiente instruccion a for */


        }
        ;


asgn :    VAR ASIGNACION expr { $$=$3; code3(varpush,(Inst)$1,assign);}
        | CONSTANTE ASIGNACION expr 
          {execerror(" NO se pueden asignar datos a constantes ",$1->nombre);}
	;

variable :    VAR {code((Inst)$1); $$ = progp;}
        ;

cond :    '(' expr ')' {code(STOP); $$ =$2;}
        ;

mientras:    MIENTRAS      {$$= code3(whilecode,STOP,STOP);}
        ;

si:       SI         {$$= code(ifcode); code3(STOP,STOP,STOP);}
        ;

end :    /* nada: produccion epsilon */  {code(STOP); $$ = progp;}
        ;

para: PARA {$$ = code3(paracode, STOP, STOP); code3(STOP, STOP, STOP);}

stmtlist:  /* nada: prodcuccion epsilon */ {$$=progp;}
        | stmtlist stmt ';'
        ;

expr :    NUMBER     		{$$=code2(constpush,(Inst)$1);}
        | VAR        		{$$=code3(varpush,(Inst)$1,eval);} 
        | CONSTANTE      	{$$=code3(varpush,(Inst)$1,eval);}
        | asgn
        | FUNCION0_PREDEFINIDA '(' ')'      {code2(funcion0,(Inst)$1->u.ptr);}
        | FUNCION1_PREDEFINIDA '(' expr ')' {$$=$3;code2(funcion1,(Inst)$1->u.ptr);}
        | FUNCION2_PREDEFINIDA '(' expr ',' expr ')'
                                            {$$=$3;code2(funcion2,(Inst)$1->u.ptr);}
        | '(' expr ')'  	{$$ = $2;}
        | expr '+' expr 	{code(sumar);}
        | expr '-' expr 	{code(restar);}
        | expr '*' expr 	{code(multiplicar);}
        | expr DIV expr 	{code(dividir);}
        | expr DIV_ENT expr {code(dividir_entero);}
        | expr MOD expr 	{code(modulo);}
        | expr '^' expr 	{code(potencia);}
        |'-' expr %prec UNARIO 	{$$=$2; code(negativo);}
        |'+' expr %prec UNARIO 	{$$=$2; code(positivo);}
        | expr MAYOR_QUE expr 	{code(mayor_que);}
        | expr MAYOR_IGUAL expr {code(mayor_igual);}
        | expr MENOR_QUE expr 	{code(menor_que);}
        | expr MENOR_IGUAL expr {code(menor_igual);}
        | expr IGUAL expr 	{code(igual);}
        | expr DISTINTO expr 	{code(distinto);}
        | expr O_LOGICO expr {code(o_logico);}
        | expr Y_LOGICO expr {code(y_logico);}
        | expr NO_LOGICO expr {code(no_logico);}
      	;

%%

#include <stdio.h>
#include <ctype.h>
#include <signal.h>
#include <setjmp.h>

/* Depuracion
 1: habilitada
 0: no habilitada
 
 Se debe usar
  bison --debug ...
o
  bison -t
*/
int yydebug=0;

/* Nombre del programa */
char *progname;

/* Contador de líneas */
int lineno = 1;

/* Permite la recuperación de errores */
jmp_buf begin;

/* Dispositivo de entrada estándar de yylex() */
extern FILE * yyin;


int main(int argc, char *argv[])
{

 /* Si se invoca el intérprete con un fichero de entrada */
 /* entonces se establece como dispositivo de entrada para yylex() */
 if (argc == 2) yyin = fopen(argv[1],"r");

 progname=argv[0];

 /* inicializacion de la tabla de simbolos */
 init();

/* Establece un estado viable para continuar despues de un error */
 setjmp(begin);

 /* Establece cual va a ser la funcion para tratar errores de punto flotante */
 signal(SIGFPE,fpecatch); /* Excepcion de punto flotante*/

/* initcode inicializa el vector de intrucciones y la pila del interprete */
 for (initcode(); yyparse(); initcode()) execute(prog);

 return 0;

}

void yyerror(char *s)
{
 warning(s,(char *) 0);
}

void warning(char *s, char *t)
{
 fprintf(stderr," ** %s : %s", progname,s);
 if (t) fprintf(stderr," ---> %s ",t);
 fprintf(stderr,"  (linea %d)\n",lineno);
}

void execerror(s,t) /* recuperacion de errores durante la ejecucion */
char *s,*t;
{
 warning(s,t);
  longjmp(begin,0);
}

void fpecatch()     /*  atrapa errores de punto flotante */
{
 execerror("error de punto flotante ",(char *)0);
}

