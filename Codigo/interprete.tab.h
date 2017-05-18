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
    VAR = 259,
    CONSTANTE = 260,
    FUNCION0_PREDEFINIDA = 261,
    FUNCION1_PREDEFINIDA = 262,
    FUNCION2_PREDEFINIDA = 263,
    INDEFINIDA = 264,
    MIENTRAS = 265,
    SI = 266,
    ENTONCES = 267,
    SI_NO = 268,
    FIN_SI = 269,
    LEER = 270,
    LEER_CADENA = 271,
    ESCRIBIR = 272,
    ESCRIBIR_CADENA = 273,
    HACER = 274,
    FIN_MIENTRAS = 275,
    REPETIR = 276,
    PARA = 277,
    DESDE = 278,
    HASTA = 279,
    PASO = 280,
    FIN_PARA = 281,
    _BORRAR = 282,
    _LUGAR = 283,
    CADENA = 284,
    ASIGNACION = 285,
    O_LOGICO = 286,
    Y_LOGICO = 287,
    NO_LOGICO = 288,
    MAYOR_QUE = 289,
    MENOR_QUE = 290,
    MENOR_IGUAL = 291,
    MAYOR_IGUAL = 292,
    DISTINTO = 293,
    IGUAL = 294,
    SUMA = 295,
    RESTA = 296,
    PROD = 297,
    MOD = 298,
    DIV = 299,
    DIV_ENT = 300,
    UNARIO = 301,
    POTENCIA = 302,
    CONCAT = 303
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 14 "interprete.y" /* yacc.c:1909  */
             
       Symbol *sym;    /* puntero a la tabla de simbolos */
       Inst *inst;     /* instruccion de maquina */

#line 108 "interprete.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_INTERPRETE_TAB_H_INCLUDED  */
