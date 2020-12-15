/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PROGRAM = 258,
     VAR = 259,
     BEGI = 260,
     END = 261,
     id = 262,
     dospuntos = 263,
     tipod = 264,
     cparentesis = 265,
     pfor = 266,
     aparentesis = 267,
     igual = 268,
     NUMEROS = 269,
     punto_coma = 270,
     Op_relacionales = 271,
     op_unarios = 272,
     llavea = 273,
     cond_if = 274,
     cond_else = 275,
     llavec = 276,
     mas = 277,
     menos = 278,
     otro = 279,
     scan = 280,
     print = 281,
     comilla = 282,
     porciento = 283,
     letrad = 284,
     letrac = 285,
     letras = 286,
     letralf = 287,
     ampersand = 288,
     coma = 289
   };
#endif
/* Tokens.  */
#define PROGRAM 258
#define VAR 259
#define BEGI 260
#define END 261
#define id 262
#define dospuntos 263
#define tipod 264
#define cparentesis 265
#define pfor 266
#define aparentesis 267
#define igual 268
#define NUMEROS 269
#define punto_coma 270
#define Op_relacionales 271
#define op_unarios 272
#define llavea 273
#define cond_if 274
#define cond_else 275
#define llavec 276
#define mas 277
#define menos 278
#define otro 279
#define scan 280
#define print 281
#define comilla 282
#define porciento 283
#define letrad 284
#define letrac 285
#define letras 286
#define letralf 287
#define ampersand 288
#define coma 289



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 13 "sintactico.y"

   char cadena[100];
   int numero;


/* Line 2058 of yacc.c  */
#line 131 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
