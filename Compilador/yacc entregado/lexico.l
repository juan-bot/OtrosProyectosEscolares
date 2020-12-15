%option noyywrap
%option yylineno
%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
struct tipos{
  char identificador[120];
  int linea[155];
  int tope;
  int nlineas;
};
struct tipos tokens[40]={"",{0},-1};
int l=1,errores=0,i,j;
FILE *ce,*sal;
%}
delim [" "|\t]+
salto \n
DIGITO [0-9]+
comilla "\""
igual "="
Exp "e"|"E"
comentarios "/*"(.\n^"*/")*"*/"|"//".*
NENTEROSP  {DIGITO}+
NENTEROSN \-{DIGITO}+
NREALESP {DIGITO}*\.{DIGITO}+
NREALESN \-{DIGITO}*\.{DIGITO}+
NEXPENTERO -?{DIGITO}+("-")?{Exp}{DIGITO}+
NEXPREAL {NREALESP|NREALESN}{Exp}{DIGITO}+
mas "+"
menos "-"
op_unarios "++"|"--"
llavea "{"
llavec "}"
LETRA [a-zA-Z]
id ({LETRA}|"_"{LETRA})(("_"|{LETRA}|{DIGITO})?({LETRA}|{DIGITO})+)*
otroo "*"|"/"
ampersand "&"
letrad "d"|"D"
letrac "c"|"C"
letras "s"|"S"
letralf "lf"|"LF"

%%
"int"|"double"|"char"|"string"|"INT"|"DOUBLE"|"CHAR"|"STRING"		{return tipod;}
"d"|"D"									{return letrad;}
"c"|"C"									{return letrac;}
"s"|"S"									{return letras;}
"lf"|"LF"								{return letralf;}
"for"									{return pfor;}
"if"									{return cond_if;}
"else"									{return cond_else;}
"PROGRAM"								{return PROGRAM;}
"VAR"									{return VAR;}
"BEGIN"									{return BEGI;}
"END"									{return END;}
"scanf"									{return scan;}
"printf"								{return print;}
"%"									{return porciento;}
{id}									{
 if ((sal = fopen("tabla de simbolos.txt", "w"))  == NULL){
	 printf("Cannot open input file.\n");
	 exit(1);
 }
int band=0,i;
fprintf(sal,"Identificador     #Token  #Linea(s) en donde se encuentra\n\n");
if(tokens[0].tope==-1){
	strcpy( tokens[0].identificador, yytext );
	tokens[0].tope=0;
	tokens[0].linea[l]=1;
	band=1;
}
else{
	for(i=0;i<=tokens[0].tope;i++){
		if(strcmp(yytext,tokens[i].identificador)==0){
			tokens[i].linea[l]=1;
			band=1;
		}
	}
}
if(band==0){
	tokens[0].tope+=1;
	tokens[tokens[0].tope].nlineas=yylineno;
	strcpy(tokens[tokens[0].tope].identificador, yytext );
	tokens[tokens[0].tope].linea[yylineno]=1;
}
for(i=0;i<=tokens[0].tope;i++){
	fprintf(sal,"%-15s      8    ",tokens[i].identificador);
	for(j=0;j<=yylineno;j++){
		if(tokens[i].linea[j]==1){
			fprintf(sal,"%d ",j);
		}
	}
	fprintf(sal,"\n");
}
fclose(sal);
return id;}
{comentarios}								{}
":"									{return dospuntos;}
";"									{return punto_coma;}
"("									{return aparentesis;}
")"									{return cparentesis;}
","									{return coma;}
{comilla}								{return comilla;}
{igual}{igual}|"<="|">="|"<"|">"|"!="					{return Op_relacionales;}
{igual}									{return igual;}
{NENTEROSP}|{NENTEROSN}|{NREALESP}|{NREALESN}|{NEXPENTERO}			{return NUMEROS;}
{op_unarios}								{return op_unarios;}
{llavea}								{return llavea;}
{llavec}								{return llavec;}
{mas}									{return mas;}
{menos}									{return menos;}
{otroo}									{return otro;}
{ampersand}								{return ampersand;}
{salto}									{l++;}
{delim}									{}
.									{printf("  %-15s error lexico linea: %d\n",yytext,yylineno);errores++;}
%%
