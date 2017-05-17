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

_mod  			(?i:_mod)
_div  			(?i:_div)
_o 				(?i:_o)
_y				(?i:_y)
_no				(?i:_no)
_borrar			(?i:_borrar)
_lugar 			(?i:_lugar)
leer 			(?i:leer)
leer_cadena 	(?i:leer_cadena)
escribir 		(?i:escribir)
escribir_cadena	(?i:escribir_cadena)
si 				(?i:si)

entonces		(?i:entonces)
si_no			(?i:si_no)
fin_si			(?i:fin_si)
mientras 		(?i:mientras)
hacer 			(?i:hacer)
fin_mientras	(?i:fin_mientras)
repetir			(?i:repetir)

para 			(?i:para)
desde 			(?i:desde)
hasta 			(?i:hasta)
paso 			(?i:paso)
fin_para 		(?i:fin_para)

%%
[\t] { ; } /* saltar los espacios y los tabuladores */

{numero}+\.?|{numero}*\.{numero}+ {	double d;  
                                   		sscanf(yytext,"%lf",&d);
                                 		/* Instala el numero en la tabla de simbolos */
				   						yylval.sym=install("",NUMBER,d); 
				   						return NUMBER;}

{_mod}				{return MOD;}
{_div}				{return DIV_ENT;}
{_o}				{return O_LOGICO;}
{_y}				{return Y_LOGICO;}
{_no}				{return NO_LOGICO;}
{_borrar}			{return BORRAR;}
{_lugar} 			{return LUGAR;}
{leer}				{return LEER;}
{leer_cadena}		{return LEER_CADENA;}
{escribir}			{return ESCRIBIR;}
{escribir_cadena}	{return ESCRIBIR_CADENA;}
{si}				{return SI;}
{entonces}			{return ENTONCES;}
{si_no}				{return SI_NO;}
{fin_si}			{return FIN_SI;}
{mientras}			{return MIENTRAS;}
{hacer}				{return HACER;}
{fin_mientras}		{return FIN_MIENTRAS;}
{repetir}			{return REPETIR;}

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
