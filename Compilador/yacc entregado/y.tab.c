/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison implementation for Yacc-like parsers in C
   
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.7"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
#line 1 "sintactico.y"

 #include <stdio.h>
 #include <stdlib.h>
 extern int yylex(void);
 extern char *yytext;
 extern int yylineno;
 extern int l;
 extern int errores;
 extern FILE *yyin;
 void yyerror(char *s);
 extern FILE *ce,*sal;

/* Line 371 of yacc.c  */
#line 81 "y.tab.c"

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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
/* Line 387 of yacc.c  */
#line 13 "sintactico.y"

   char cadena[100];
   int numero;


/* Line 387 of yacc.c  */
#line 198 "y.tab.c"
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

/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 226 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(N) (N)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  7
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   472

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  35
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  23
/* YYNRULES -- Number of rules.  */
#define YYNRULES  111
/* YYNRULES -- Number of states.  */
#define YYNSTATES  381

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   289

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,    11,    19,    27,    35,    43,    51,    53,
      56,    61,    66,    71,    76,    81,    83,    86,    88,    90,
      92,    94,    96,   113,   130,   147,   164,   181,   198,   215,
     232,   249,   266,   283,   300,   317,   334,   351,   368,   373,
     378,   383,   388,   393,   395,   397,   401,   405,   407,   411,
     413,   417,   426,   435,   444,   453,   462,   471,   480,   488,
     496,   504,   512,   520,   528,   536,   544,   546,   549,   551,
     553,   555,   557,   559,   561,   563,   565,   567,   569,   571,
     573,   575,   577,   579,   581,   583,   585,   587,   590,   593,
     596,   599,   602,   604,   606,   609,   613,   615,   623,   628,
     636,   644,   652,   660,   668,   673,   678,   683,   687,   691,
     693,   695
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      36,     0,    -1,     3,     7,     4,    37,     5,    39,     6,
      -1,     1,     7,     4,    37,     5,    39,     6,    -1,     3,
       1,     4,    37,     5,    39,     6,    -1,     3,     7,     1,
      37,     5,    39,     6,    -1,     3,     7,     4,    37,     1,
      39,     6,    -1,     3,     1,     1,    37,     5,    39,     6,
      -1,    38,    -1,    38,    37,    -1,    43,     8,     9,    15,
      -1,     1,     8,     9,    15,    -1,    43,     1,     9,    15,
      -1,    43,     8,     1,    15,    -1,    43,     8,     9,     1,
      -1,    40,    -1,    40,    39,    -1,    41,    -1,    42,    -1,
      47,    -1,    48,    -1,    55,    -1,    11,    12,     7,    13,
      14,    15,     7,    16,    14,    15,     7,    17,    10,    18,
      39,    21,    -1,     1,    12,     7,    13,    14,    15,     7,
      16,    14,    15,     7,    17,    10,    18,    39,    21,    -1,
      11,     1,     7,    13,    14,    15,     7,    16,    14,    15,
       7,    17,    10,    18,    39,    21,    -1,    11,    12,     1,
      13,    14,    15,     7,    16,    14,    15,     7,    17,    10,
      18,    39,    21,    -1,    11,    12,     7,     1,    14,    15,
       7,    16,    14,    15,     7,    17,    10,    18,    39,    21,
      -1,    11,    12,     7,    13,     1,    15,     7,    16,    14,
      15,     7,    17,    10,    18,    39,    21,    -1,    11,    12,
       7,    13,    14,     1,     7,    16,    14,    15,     7,    17,
      10,    18,    39,    21,    -1,    11,    12,     7,    13,    14,
      15,     1,    16,    14,    15,     7,    17,    10,    18,    39,
      21,    -1,    11,    12,     7,    13,    14,    15,     7,     1,
      14,    15,     7,    17,    10,    18,    39,    21,    -1,    11,
      12,     7,    13,    14,    15,     7,    16,     1,    15,     7,
      17,    10,    18,    39,    21,    -1,    11,    12,     7,    13,
      14,    15,     7,    16,    14,     1,     7,    17,    10,    18,
      39,    21,    -1,    11,    12,     7,    13,    14,    15,     7,
      16,    14,    15,     1,    17,    10,    18,    39,    21,    -1,
      11,    12,     7,    13,    14,    15,     7,    16,    14,    15,
       7,     1,    10,    18,    39,    21,    -1,    11,    12,     7,
      13,    14,    15,     7,    16,    14,    15,     7,    17,     1,
      18,    39,    21,    -1,    11,    12,     7,    13,    14,    15,
       7,    16,    14,    15,     7,    17,    10,     1,    39,    21,
      -1,    11,    12,     7,    13,    14,    15,     7,    16,    14,
      15,     7,    17,    10,    18,    39,     1,    -1,     7,    13,
      44,    15,    -1,     7,    13,    44,     1,    -1,     1,    13,
      44,    15,    -1,     7,     1,    44,    15,    -1,     7,    13,
       1,    15,    -1,     7,    -1,    45,    -1,    44,    22,    45,
      -1,    44,    23,    45,    -1,    46,    -1,    45,    24,    46,
      -1,    14,    -1,    12,    44,    10,    -1,    25,    12,    27,
      51,    27,    53,    10,    15,    -1,     1,    12,    27,    51,
      27,    53,    10,    15,    -1,    25,     1,    27,    51,    27,
      53,    10,    15,    -1,    25,    12,     1,    51,    27,    53,
      10,    15,    -1,    25,    12,    27,    51,     1,    53,    10,
      15,    -1,    25,    12,    27,    51,    27,    53,     1,    15,
      -1,    25,    12,    27,    51,    27,    53,    10,     1,    -1,
      26,    12,    27,    49,    27,    10,    15,    -1,     1,    12,
      27,    49,    27,    10,    15,    -1,    26,     1,    27,    49,
      27,    10,    15,    -1,    26,    12,     1,    49,    27,    10,
      15,    -1,    26,    12,    27,     1,    27,    10,    15,    -1,
      26,    12,    27,    49,     1,    10,    15,    -1,    26,    12,
      27,    49,    27,     1,    15,    -1,    26,    12,    27,    49,
      27,    10,     1,    -1,    50,    -1,    50,    49,    -1,    52,
      -1,     7,    -1,     8,    -1,     9,    -1,    10,    -1,    12,
      -1,    13,    -1,    14,    -1,    15,    -1,    16,    -1,    17,
      -1,    18,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    33,    -1,    34,    -1,    52,    -1,    52,    51,    -1,
      28,    29,    -1,    28,    30,    -1,    28,    32,    -1,    28,
      31,    -1,     1,    -1,    54,    -1,    54,    53,    -1,    34,
      33,     7,    -1,     1,    -1,    19,    12,    56,    10,    18,
      39,    21,    -1,    20,    18,    39,    21,    -1,     1,    12,
      56,    10,    18,    39,    21,    -1,    19,     1,    56,    10,
      18,    39,    21,    -1,    19,    12,    56,     1,    18,    39,
      21,    -1,    19,    12,    56,    10,     1,    39,    21,    -1,
      19,    12,    56,    10,    18,    39,     1,    -1,     1,    18,
      39,    21,    -1,    20,     1,    39,    21,    -1,    20,    18,
      39,     1,    -1,    57,    16,    57,    -1,    57,     1,    57,
      -1,     7,    -1,    14,    -1,     1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    51,    51,    51,    51,    51,    51,    51,    52,    52,
      53,    53,    53,    53,    53,    54,    54,    55,    55,    55,
      55,    55,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    57,    58,
      58,    58,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    67,    67,    67,    67,    67,    67,    68,    68,
      68,    68,    68,    68,    68,    68,    69,    69,    70,    70,
      70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
      70,    70,    70,    70,    70,    70,    71,    71,    72,    72,
      72,    72,    72,    73,    73,    74,    74,    75,    75,    75,
      75,    75,    75,    75,    75,    75,    75,    76,    76,    78,
      79,    80
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "PROGRAM", "VAR", "BEGI", "END", "id",
  "dospuntos", "tipod", "cparentesis", "pfor", "aparentesis", "igual",
  "NUMEROS", "punto_coma", "Op_relacionales", "op_unarios", "llavea",
  "cond_if", "cond_else", "llavec", "mas", "menos", "otro", "scan",
  "print", "comilla", "porciento", "letrad", "letrac", "letras", "letralf",
  "ampersand", "coma", "$accept", "INICIO", "listaDeclaraciones",
  "declaracion", "listaProposiciones", "Proposicion", "CicloFors",
  "Asignacion", "n2", "Exp", "Term", "Factor", "Lectura", "Escritura",
  "Cadena", "cad", "P", "PA", "W", "WA", "Estructura_Control", "Condicion",
  "n", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    35,    36,    36,    36,    36,    36,    36,    37,    37,
      38,    38,    38,    38,    38,    39,    39,    40,    40,    40,
      40,    40,    41,    41,    41,    41,    41,    41,    41,    41,
      41,    41,    41,    41,    41,    41,    41,    41,    42,    42,
      42,    42,    42,    43,    44,    44,    44,    45,    45,    46,
      46,    47,    47,    47,    47,    47,    47,    47,    48,    48,
      48,    48,    48,    48,    48,    48,    49,    49,    50,    50,
      50,    50,    50,    50,    50,    50,    50,    50,    50,    50,
      50,    50,    50,    50,    50,    50,    51,    51,    52,    52,
      52,    52,    52,    53,    53,    54,    54,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    56,    56,    57,
      57,    57
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     7,     7,     7,     7,     7,     7,     1,     2,
       4,     4,     4,     4,     4,     1,     2,     1,     1,     1,
       1,     1,    16,    16,    16,    16,    16,    16,    16,    16,
      16,    16,    16,    16,    16,    16,    16,    16,     4,     4,
       4,     4,     4,     1,     1,     3,     3,     1,     3,     1,
       3,     8,     8,     8,     8,     8,     8,     8,     7,     7,
       7,     7,     7,     7,     7,     7,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     2,     2,
       2,     2,     1,     1,     2,     3,     1,     7,     4,     7,
       7,     7,     7,     7,     4,     4,     4,     3,     3,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,    43,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    17,    18,    19,    20,    21,     0,     0,     0,
       0,     0,     0,     0,     0,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,    16,    12,    13,    14,    10,     7,     4,     5,
       6,     2,   111,   109,   110,     0,     0,     0,     0,    49,
       0,    44,    47,     0,     0,     0,     0,     0,     0,     0,
     109,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    92,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,     0,    84,
      85,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,   104,    41,    42,    39,    38,     0,     0,
       0,     0,     0,     0,     0,   105,   106,    98,     0,     0,
       0,     0,     0,    68,     0,    92,     0,     0,    88,    89,
      91,    90,     0,    67,     0,    87,     0,   108,   107,    50,
      45,    46,    48,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    96,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    59,
       0,     0,    94,    99,     0,     0,     0,     0,     0,     0,
       0,   100,   101,   102,   103,    97,     0,     0,     0,     0,
       0,    60,    61,    62,    63,    64,    65,    58,     0,    95,
      52,     0,     0,     0,     0,     0,     0,     0,     0,    53,
      54,    55,    56,    57,    51,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      22
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,    15,    16,    40,    41,    42,    43,    17,    90,
      91,    92,    44,    45,   131,   132,   175,   159,   205,   206,
      46,    86,    87
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -81
static const yytype_int16 yypact[] =
{
     209,    56,   231,   109,   110,   266,   267,   -81,   253,   253,
     253,   253,   253,   265,   -81,   139,   248,   225,   234,   264,
     270,   261,   252,   168,   -81,   268,    14,   168,   168,   168,
     168,   168,   263,   238,   173,   215,   217,    63,   218,   223,
     273,   146,   -81,   -81,   -81,   -81,   -81,   269,   271,    12,
     274,   275,   276,   277,   279,   -81,   141,   260,   168,   260,
     203,   280,   256,   206,   206,   168,   168,   249,    32,   262,
      64,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,
     -81,   -81,   -81,   278,   -81,    89,   282,   120,   260,   -81,
      93,   272,   -81,   281,   221,   283,   155,   284,   286,   210,
     -81,   285,   179,   302,    11,    25,    25,    25,    89,    89,
     117,   287,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,
     -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -13,   -81,
     -81,   297,    33,   298,    61,   288,   206,   206,    -1,   -81,
     260,   260,   260,   -81,   -81,   -81,   -81,   -81,   289,   290,
     291,   207,   308,   309,   136,   -81,   -81,   -81,   301,     9,
     303,    92,   304,   -81,   305,   306,   119,   292,   -81,   -81,
     -81,   -81,   319,   -81,    24,   -81,   168,   -81,   -81,   -81,
     272,   272,   -81,   320,   321,   322,   323,   180,   168,   168,
     168,   168,    24,    24,    24,    24,   324,   329,   330,   331,
     224,   293,   327,   -81,   255,   333,    10,   325,   337,   338,
     340,   341,   342,   257,   332,   334,   335,    71,   344,   347,
     348,   227,   336,   345,   346,   349,   350,   184,   343,   -81,
     355,   351,   -81,   -81,   352,   353,   354,   356,   357,   358,
     127,   -81,   -81,   -81,   -81,   -81,   360,   361,   362,   363,
     190,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   365,   -81,
     -81,   366,   367,   368,   369,   370,   371,   372,   208,   -81,
     -81,   -81,   -81,   -81,   -81,   373,   374,   375,   376,   377,
     378,   379,   380,   381,   191,   364,   390,   391,   392,   393,
     394,   395,   396,   397,   398,   258,   389,   399,   400,   401,
     402,   403,   404,   405,   406,   407,   408,     7,   416,   417,
     418,   419,   420,   421,   422,   423,   424,   425,   426,   427,
     230,   428,   429,   430,   431,   432,   433,   434,   435,   436,
     437,   438,   439,   440,   172,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     386,   387,   388,   441,   442,   443,   444,   445,   446,   447,
     448,   449,   450,   451,    79,   -81,   -81,   -81,   -81,   -81,
     -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,
     -81
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -81,   -81,   236,   -81,   -27,   -81,   -81,   -81,   -81,   -53,
     -54,   148,   -81,   -81,    50,   -81,    91,   -80,     8,   -81,
     -81,   178,    47
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -94
static const yytype_int16 yytable[] =
{
      50,    51,    52,    53,    54,   134,    94,    96,   319,   179,
     112,   203,   156,    75,    72,    48,   168,   169,   170,   171,
     -93,   140,   141,    49,   320,   203,   112,    76,   163,   163,
     163,    93,   157,   106,   112,   138,   -86,   128,   103,   104,
     113,   114,   115,   116,   204,   117,   118,   119,   120,   121,
     122,   123,   163,   128,   124,   125,   126,   127,   204,   107,
     -66,   128,   112,     4,    65,   109,   129,   130,   -68,   -68,
     -68,   -68,   244,   -68,   -68,   -68,   -68,   -68,   -68,   -68,
     379,    66,   -68,   -68,   -68,   -68,   180,   181,   -68,   128,
     112,   110,   245,   194,   -68,   -68,   113,   114,   115,   116,
     380,   117,   118,   119,   120,   121,   122,   123,   139,     7,
     124,   125,   126,   127,     8,   140,   141,   128,   165,   195,
     199,   136,   129,   130,   113,   114,   115,   116,   267,   117,
     118,   119,   120,   121,   122,   123,   137,   190,   124,   125,
     126,   127,    82,   268,    23,   128,   200,    33,    83,   207,
     129,   130,   -15,    34,   191,    84,   146,    35,   162,   164,
     166,   214,   215,   216,   217,    36,    37,   -15,    85,    33,
     147,    38,    39,   348,    59,    34,   133,   140,   141,    35,
     153,   212,   173,   177,   178,   256,    60,    36,    37,   154,
     349,   273,   294,    38,    39,   213,   158,   160,   161,   257,
     218,   219,   220,   221,    95,   274,   295,    82,   186,   283,
       1,   150,     2,   100,   232,    88,    61,    89,    63,    67,
      84,   187,   284,   151,    69,   226,    25,    62,   249,    64,
      68,   333,     5,    26,   227,    70,   144,   250,     6,    27,
     334,   101,   102,   140,   141,    18,    19,    20,    21,    13,
      56,    57,    24,    -8,    13,    14,    58,    98,   239,   306,
      14,    32,    30,    99,   240,   307,    31,     9,    11,    28,
      10,    12,    88,    22,    89,    29,   105,    47,    55,    71,
      77,    78,    79,    80,    73,    81,    74,    97,   230,   108,
     182,   111,   135,     0,     0,   152,   142,   148,   145,   149,
     228,   167,   143,   183,   184,   185,   176,   201,   350,   351,
     352,   353,   354,   355,   356,   357,   358,   359,   360,   361,
     362,   363,   364,   155,   172,   174,   188,   189,   192,   202,
     193,   196,   197,   198,   222,   208,   209,   210,   211,   223,
     224,   225,   229,   231,   234,   235,   233,   236,   237,   238,
       0,   251,     0,   241,   246,   242,   243,   247,   248,   258,
     252,   253,   259,     0,   254,   255,   260,     0,   261,   262,
     263,   296,   264,   265,   266,   269,   270,   271,   272,   275,
     276,   277,   278,   279,   280,   281,   282,     0,   285,   286,
     287,   288,   289,   290,   291,   292,   293,   297,   298,   299,
     300,   301,   302,   303,   304,   305,   308,   365,   366,   367,
       0,     0,     0,     0,     0,     0,   309,   310,   311,   312,
     313,   314,   315,   316,   317,   318,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,     0,     0,
       0,     0,     0,     0,     0,     0,   335,   336,   337,   338,
     339,   340,   341,   342,   343,   344,   345,   346,   347,     0,
       0,     0,   368,   369,   370,   371,   372,   373,   374,   375,
     376,   377,   378
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-81)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      27,    28,    29,    30,    31,    85,    59,    60,     1,    10,
       1,     1,     1,     1,    41,     1,    29,    30,    31,    32,
      10,    22,    23,     9,    17,     1,     1,    15,   108,   109,
     110,    58,    21,     1,     1,    88,    27,    28,    65,    66,
       7,     8,     9,    10,    34,    12,    13,    14,    15,    16,
      17,    18,   132,    28,    21,    22,    23,    24,    34,    27,
      27,    28,     1,     7,     1,     1,    33,    34,     7,     8,
       9,    10,     1,    12,    13,    14,    15,    16,    17,    18,
       1,    18,    21,    22,    23,    24,   140,   141,    27,    28,
       1,    27,    21,     1,    33,    34,     7,     8,     9,    10,
      21,    12,    13,    14,    15,    16,    17,    18,    15,     0,
      21,    22,    23,    24,     4,    22,    23,    28,     1,    27,
       1,     1,    33,    34,     7,     8,     9,    10,     1,    12,
      13,    14,    15,    16,    17,    18,    16,     1,    21,    22,
      23,    24,     1,    16,     5,    28,    27,     1,     7,   176,
      33,    34,     6,     7,    18,    14,     1,    11,   108,   109,
     110,   188,   189,   190,   191,    19,    20,    21,    27,     1,
      15,    25,    26,     1,     1,     7,    85,    22,    23,    11,
       1,     1,   132,   136,   137,     1,    13,    19,    20,    10,
      18,     1,     1,    25,    26,    15,   105,   106,   107,    15,
     192,   193,   194,   195,     1,    15,    15,     1,     1,     1,
       1,     1,     3,     7,   206,    12,     1,    14,     1,     1,
      14,    14,    14,    13,     1,     1,     1,    12,     1,    12,
      12,     1,     1,     8,    10,    12,    15,    10,     7,     5,
      10,    63,    64,    22,    23,     9,    10,    11,    12,     1,
      12,    13,    16,     5,     1,     7,    18,     1,     1,     1,
       7,     9,     1,     7,     7,     7,     5,     1,     1,     5,
       4,     4,    12,     8,    14,     5,    27,     9,    15,     6,
       6,     6,     6,     6,    15,     6,    15,     7,    33,    27,
     142,    13,    10,    -1,    -1,    10,    24,    13,    15,    13,
       7,    14,    21,    14,    14,    14,    18,    15,   335,   336,
     337,   338,   339,   340,   341,   342,   343,   344,   345,   346,
     347,   348,   349,    21,    27,    27,    18,    18,    27,    10,
      27,    27,    27,    27,    10,    15,    15,    15,    15,    10,
      10,    10,    15,    10,     7,     7,    21,     7,     7,     7,
      -1,    15,    -1,    21,    10,    21,    21,    10,    10,    16,
      15,    15,     7,    -1,    15,    15,    15,    -1,    16,    16,
      16,     7,    16,    16,    16,    15,    15,    15,    15,    14,
      14,    14,    14,    14,    14,    14,    14,    -1,    15,    15,
      15,    15,    15,    15,    15,    15,    15,     7,     7,     7,
       7,     7,     7,     7,     7,     7,    17,    21,    21,    21,
      -1,    -1,    -1,    -1,    -1,    -1,    17,    17,    17,    17,
      17,    17,    17,    17,    17,    17,    10,    10,    10,    10,
      10,    10,    10,    10,    10,    10,    10,    10,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    18,    18,    18,    18,
      18,    18,    18,    18,    18,    18,    18,    18,    18,    -1,
      -1,    -1,    21,    21,    21,    21,    21,    21,    21,    21,
      21,    21,    21
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,    36,     7,     1,     7,     0,     4,     1,
       4,     1,     4,     1,     7,    37,    38,    43,    37,    37,
      37,    37,     8,     5,    37,     1,     8,     5,     5,     5,
       1,     5,     9,     1,     7,    11,    19,    20,    25,    26,
      39,    40,    41,    42,    47,    48,    55,     9,     1,     9,
      39,    39,    39,    39,    39,    15,    12,    13,    18,     1,
      13,     1,    12,     1,    12,     1,    18,     1,    12,     1,
      12,     6,    39,    15,    15,     1,    15,     6,     6,     6,
       6,     6,     1,     7,    14,    27,    56,    57,    12,    14,
      44,    45,    46,    39,    44,     1,    44,     7,     1,     7,
       7,    56,    56,    39,    39,    27,     1,    27,    27,     1,
      27,    13,     1,     7,     8,     9,    10,    12,    13,    14,
      15,    16,    17,    18,    21,    22,    23,    24,    28,    33,
      34,    49,    50,    51,    52,    10,     1,    16,    44,    15,
      22,    23,    24,    21,    15,    15,     1,    15,    13,    13,
       1,    13,    10,     1,    10,    21,     1,    21,    51,    52,
      51,    51,    49,    52,    49,     1,    49,    14,    29,    30,
      31,    32,    27,    49,    27,    51,    18,    57,    57,    10,
      45,    45,    46,    14,    14,    14,     1,    14,    18,    18,
       1,    18,    27,    27,     1,    27,    27,    27,    27,     1,
      27,    15,    10,     1,    34,    53,    54,    39,    15,    15,
      15,    15,     1,    15,    39,    39,    39,    39,    53,    53,
      53,    53,    10,    10,    10,    10,     1,    10,     7,    15,
      33,    10,    53,    21,     7,     7,     7,     7,     7,     1,
       7,    21,    21,    21,     1,    21,    10,    10,    10,     1,
      10,    15,    15,    15,    15,    15,     1,    15,    16,     7,
      15,    16,    16,    16,    16,    16,    16,     1,    16,    15,
      15,    15,    15,     1,    15,    14,    14,    14,    14,    14,
      14,    14,    14,     1,    14,    15,    15,    15,    15,    15,
      15,    15,    15,    15,     1,    15,     7,     7,     7,     7,
       7,     7,     7,     7,     7,     7,     1,     7,    17,    17,
      17,    17,    17,    17,    17,    17,    17,    17,    17,     1,
      17,    10,    10,    10,    10,    10,    10,    10,    10,    10,
      10,    10,    10,     1,    10,    18,    18,    18,    18,    18,
      18,    18,    18,    18,    18,    18,    18,    18,     1,    18,
      39,    39,    39,    39,    39,    39,    39,    39,    39,    39,
      39,    39,    39,    39,    39,    21,    21,    21,    21,    21,
      21,    21,    21,    21,    21,    21,    21,    21,    21,     1,
      21
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))

/* Error token number */
#define YYTERROR	1
#define YYERRCODE	256


/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */
#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
        break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
        break;
    }
}




/* The lookahead symbol.  */
int yychar;


#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE(yyval_default);

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 43:
/* Line 1792 of yacc.c  */
#line 59 "sintactico.y"
    {printf("%s\n",yytext);}
    break;


/* Line 1792 of yacc.c  */
#line 1746 "y.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


/* Line 2055 of yacc.c  */
#line 81 "sintactico.y"

main() {
 int i,j,band;
 if ((ce = fopen("codigo.txt", "rt"))  == NULL){
	 printf("Cannot open input file.\n");
	 exit(1);
 }
 printf("\n");
 fprintf(sal," lexema      #token #linea\n\n");
 yyin=ce;
 yyparse();
 printf("\n      %d lineas compiladas",l);
 printf("\n      %d errores encontrados\n",errores);
 fclose(ce);
}
void yyerror(char *msg){
	//printf("%c\n",yytext[4]);
	printf("  %-15s %s linea: %d\n",yytext,msg,yylineno);
	errores++;
}