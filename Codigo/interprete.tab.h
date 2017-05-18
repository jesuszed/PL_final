/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
     IGUAL = 291,
     DISTINTO = 292,
     MAYOR_IGUAL = 293,
     MENOR_IGUAL = 294,
     MENOR_QUE = 295,
     MAYOR_QUE = 296,
     CONCATENACION = 297,
     _DIV = 298,
     _MOD = 299,
     _NO = 300,
     UNARIO = 301,
     POTENCIA = 302
   };
#endif
/* Tokens.  */
#define NUMBER 258
#define CADENA 259
#define VAR 260
#define CONSTANTE 261
#define FUNCION0_PREDEFINIDA 262
#define FUNCION1_PREDEFINIDA 263
#define FUNCION2_PREDEFINIDA 264
#define INDEFINIDA 265
#define LEER 266
#define LEER_CADENA 267
#define ESCRIBIR 268
#define ESCRIBIR_CADENA 269
#define SI 270
#define ENTONCES 271
#define SI_NO 272
#define FIN_SI 273
#define MIENTRAS 274
#define HACER 275
#define FIN_MIENTRAS 276
#define REPETIR 277
#define HASTA 278
#define PARA 279
#define DESDE 280
#define PASO 281
#define FIN_PARA 282
#define _BORRAR 283
#define _LUGAR 284
#define SUMA 285
#define RESTA 286
#define PROD 287
#define ASIGNACION 288
#define _O 289
#define _Y 290
#define IGUAL 291
#define DISTINTO 292
#define MAYOR_IGUAL 293
#define MENOR_IGUAL 294
#define MENOR_QUE 295
#define MAYOR_QUE 296
#define CONCATENACION 297
#define _DIV 298
#define _MOD 299
#define _NO 300
#define UNARIO 301
#define POTENCIA 302




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 14 "interprete.y"
{             
       Symbol *sym;    /* puntero a la tabla de simbolos */
       Inst *inst;     /* instruccion de maquina */
}
/* Line 1529 of yacc.c.  */
#line 148 "interprete.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

