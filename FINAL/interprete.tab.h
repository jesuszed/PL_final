/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_INTERPRETE_TAB_H_INCLUDED
# define YY_YY_INTERPRETE_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUMBER = 258,
    CADENA = 259,
    VAR = 260,
    CONSTANTE = 261,
    FUNCION0_PREDEFINIDA = 262,
    FUNCION1_PREDEFINIDA = 263,
    FUNCION2_PREDEFINIDA = 264,
    INDEFINIDA = 265,
    LEER = 266,
    LEER_CADENA = 267,
    ESCRIBIR = 268,
    ESCRIBIR_CADENA = 269,
    SI = 270,
    ENTONCES = 271,
    SI_NO = 272,
    FIN_SI = 273,
    MIENTRAS = 274,
    HACER = 275,
    FIN_MIENTRAS = 276,
    REPETIR = 277,
    HASTA = 278,
    PARA = 279,
    DESDE = 280,
    PASO = 281,
    FIN_PARA = 282,
    _BORRAR = 283,
    _LUGAR = 284,
    SUMA = 285,
    RESTA = 286,
    PROD = 287,
    ASIGNACION = 288,
    _O = 289,
    _Y = 290,
    MAYOR_QUE = 291,
    MENOR_QUE = 292,
    MENOR_IGUAL = 293,
    MAYOR_IGUAL = 294,
    DISTINTO = 295,
    IGUAL = 296,
    _MOD = 297,
    _DIV = 298,
    CONCATENACION = 299,
    UNARIO = 300,
    _NO = 301,
    POTENCIA = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 13 "interprete.y" /* yacc.c:1909  */

       Symbol *sym;    /* puntero a la tabla de simbolos */
       Inst *inst;     /* instruccion de maquina */

#line 107 "interprete.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_INTERPRETE_TAB_H_INCLUDED  */
