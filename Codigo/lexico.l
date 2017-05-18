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
numero          [0-9]
letra           [a-zA-Z]
identificador   {letra}(_?({letra}|{numero}))*

_mod 			(?i:_mod)            
_div 			(?i:_div)            
_o 				(?i:_o)              
_y 				(?i:_y)              
_no 			(?i:_no)             
leer 			(?i:leer)            
leer_cadena 	(?i:leer_cadena)     
escribir 		(?i:escribir)        
escribir_cadena (?i:escribir_cadena) 
si 				(?i:SI)              
entonces 		(?i:entonces)        
si_no 			(?i:si_no)           
fin_si 			(?i:fin_si)          
mientras 		(?i:mientras)        
hacer 			(?i:hacer)           
fin_mientras 	(?i:fin_mientras)    
repetir 		(?i:repetir)         
hasta 			(?i:hasta)           
para 			(?i:para)            
desde 			(?i:desde)           
paso 			(?i:paso)            
fin_para 		(?i:fin_para)        
_borrar 		(?i:_borrar)         
_lugar 			(?i:_lugar)          

%%
[ \t] { ; } /* saltar los espacios y los tabuladores */

{numero}+\.?|{numero}*\.{numero}+ {	double d;  
                                   		sscanf(yytext,"%lf",&d);
                                 		/* Instala el numero en la tabla de simbolos */
				   						yylval.sym=install("",NUMBER,d); 
				   						return NUMBER;}

{_mod}            {return _MOD;}
{_div}            {return _DIV;}
{_o}              {return _O;}
{_y}              {return _Y;}
{_no}             {return _NO;}
{leer}            {return LEER;}
{leer_cadena}     {return LEER_CADENA;}
{escribir}        {return ESCRIBIR;}
{escribir_cadena} {return ESCRIBIR_CADENA;}
{si}              {return SI;}
{entonces}        {return ENTONCES;}
{si_no}           {return SI_NO;}
{fin_si}          {return FIN_SI;}
{mientras}        {return MIENTRAS;}
{hacer}           {return HACER;}
{fin_mientras}    {return FIN_MIENTRAS;}
{repetir}         {return REPETIR;}
{hasta}           {return HASTA;}
{para}            {return PARA;}
{desde}           {return DESDE;}
{paso}            {return PASO;}
{fin_para}        {return FIN_PARA;}
{_borrar}         {return _BORRAR;}
{_lugar}          {return _LUGAR;}

{numero}+(\.{numero}+)?([eE][+-]?{numero}+)? {double d;
                                   sscanf(yytext,"%lf",&d);
                                 /* Instala el numero en la tabla de simbolos */
                   yylval.sym=install("",NUMBER,d);
                   return NUMBER;}

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

":="                    {return ASIGNACION;}
"+"                     {return SUMA;}
"-"                     {return RESTA;}
"*"                     {return PROD;}
"/"                     {return _DIV;}
">="					{return MAYOR_IGUAL;}
"<="					{return MENOR_IGUAL;}
"=="					{return IGUAL;}
"!="					{return DISTINTO;}
">"						{return MAYOR_QUE;}
"<"						{return MENOR_QUE;}
"**"					{return POTENCIA;}
"||"					{return CONCATENACION;}






^#       { 
	  BORRAR; 
	  LUGAR(10,10);
	  IYELLOW;
	  printf(">>>>>>> Fin del programa <<<<<<<\n");
	  RESET;
	  LUGAR(12,1);
 	  return 0;
	}
 	 
\n      {lineno++; } /* no se devuelve nada, continúa el analisis léxico */
.       {return yytext[0];}
