%{
#include "macros.h"
#include "interprete.h"
#include "interprete.tab.h"
extern char *progname;
extern int lineno;
char *cadena;
int size;
%}
/* definiciones regulares */
numero        [0-9]
letra         [a-zA-Z]
identificador {letra}(_?({letra}|{numero}))*

_mod      (?i:_mod)            
_div      (?i:_div)            
_o        (?i:_o)              
_y        (?i:_y)              
_no       (?i:_no)             
leer      (?i:leer)            
leer_cadena   (?i:leer_cadena)     
escribir    (?i:escribir)        
escribir_cadena (?i:escribir_cadena) 
si        (?i:SI)              
entonces    (?i:entonces)        
si_no       (?i:si_no)           
fin_si      (?i:fin_si)          
mientras    (?i:mientras)        
hacer       (?i:hacer)           
fin_mientras  (?i:fin_mientras)    
repetir     (?i:repetir)         
hasta       (?i:hasta)           
para      (?i:para)            
desde       (?i:desde)           
paso      (?i:paso)            
fin_para    (?i:fin_para)        
_borrar     (?i:_borrar)         
_lugar      (?i:_lugar)  


%x ESTADO_CADENA
%x ESTADO_COMENTARIO

%%
[ \t] { ; } /* saltar los espacios y los tabuladores */

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
                   if ((s=lookup(yytext)) == 0)
                               s = install (yytext, INDEFINIDA, 0.0);
                    yylval.sym = s;
                    return s->tipo == INDEFINIDA ? VAR : s->tipo;}

"\'" {
  BEGIN ESTADO_CADENA;
  cadena = (char *) malloc(sizeof(char));
  size = 0;
}

<ESTADO_CADENA>"\'" {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = '\0';
  yylval.sym=installcadena("",CADENA,cadena);
  free(cadena);
  BEGIN 0;
  return CADENA;
}

<ESTADO_CADENA>"\\\'" {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = '\'';
  size++;
}

<ESTADO_CADENA>"\\n" {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = '\n';
  size++;
}

<ESTADO_CADENA>"\\t" {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = '\t';
  size++;
}

<ESTADO_CADENA>. {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = *yytext;
  size++;
}

<ESTADO_CADENA>\n {
  cadena = (char *) realloc(cadena, (size+1)*sizeof(char));
  cadena[size] = *yytext;
  size++;
  lineno++;
}

"||" {return CONCATENACION;}
"**" {return POTENCIA;}

">="	{return MAYOR_IGUAL;}
"<="	{return MENOR_IGUAL;}
"="	{return IGUAL;}
"<>"	{return DISTINTO;}
">"	{return MAYOR_QUE;}
"<"	{return MENOR_QUE;}
":="      {return ASIGNACION;}

"#" {
  BEGIN ESTADO_COMENTARIO;
}

<ESTADO_COMENTARIO>"#" {
  BEGIN 0;
}

<ESTADO_COMENTARIO>.|\n {lineno++;}

"@".* {;}

<<EOF>>       {
  	  return 0;
	}
\n      {lineno++; } /* no se devuelve nada, contin�a el analisis l�xico */
.       {return yytext[0];}
