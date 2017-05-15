%{
#include "macros.h"
#include "interprete.h"
#include "interprete.tab.h"
#include <ctype.h>
#include <string.h>
extern char *progname;
extern int lineno;
%}

/* definiciones regulares */
numero        [0-9]
letra         [a-zA-Z]
identificador {letra}({letra}|{numero})*
_mod  (?i:_mod)
_div  (?i:_div)
%%
[\t] { ; } /* saltar los espacios y los tabuladores */

{numero}+\.?|{numero}*\.{numero}+ {	double d;  
                                   		sscanf(yytext,"%lf",&d);
                                 		/* Instala el numero en la tabla de simbolos */
				   						yylval.sym=install("",NUMBER,d); 
				   						return NUMBER;}

{_mod}	{return MOD;}
{_div}	{return DIV_ENT;}

{identificador} { Symbol *s;
					int i=0;
					while(yytext[i])
					{
						yytext[i] =  tolower(yytext[i]);
						i++;
					}
                   if ((s=lookup(yytext)) == 0)
                               s = install (yytext, INDEFINIDA, 0.0);
                    yylval.sym = s;
                    return s->tipo == INDEFINIDA ? VAR : s->tipo;}

">="	{return MAYOR_IGUAL;}
"<="	{return MENOR_IGUAL;}
"=="	{return IGUAL;}
"!="	{return DISTINTO;}
">"		{return MAYOR_QUE;}
"<"		{return MENOR_QUE;}
"!"		{return NEGACION;}
"||"	{return O_LOGICO;}
"&&"	{return Y_LOGICO;}
":="    {return ASIGNACION;}

"/"		{return DIV;}





^#       { 
	  CLEAR_SCREEN; 
	  LUGAR(10,10);
	  IYELLOW;
	  printf(">>>>>>> Fin del programa <<<<<<<\n");
	  RESET;
	  LUGAR(12,1);
 	  return 0;
	}
 	 
\n      {lineno++; } /* no se devuelve nada, continúa el analisis léxico */
.       {return yytext[0];}
