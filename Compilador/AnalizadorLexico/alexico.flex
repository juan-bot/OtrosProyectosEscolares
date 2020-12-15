/*Seccion de codigo de usuario*/
package analizadorlex;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

//clase de los token devueltos
class Yytoken {
    Yytoken (int numToken,String token, int linea){
        //Contador para el número de tokens reconocidos
        this.numToken = numToken;
        //String del token reconocido
        this.token = new String(token);
        //Tipo de componente léxico encontrado
        this.linea = linea+1;
        //Columna donde empieza el primer carácter del token
    }
    //Métodos de los atributos de la clase
    public int numToken;
    public String token;
    public int linea;
    //Metodo que devuelve los datos necesarios que escribiremos en un archive de salida
    public String toString() {
        return "#"+numToken+" "+token+"  linea:"+linea;
    }
}

/* Seccion de opciones y declaraciones de JFlex */
%% //inicio de opciones
//Cambiamos el nombre la funcion para el siguiente token por nextToken
%function nextToken
//Clase publica
%public
//Cambiamos el nombre de la clase del analizador
%class AnalizadorLexico
//Agregamos soporte a unicode
%unicode
//Codigo java
%{
	
    private int i;
    private ArrayList<Yytoken> tokens;

	private void writeOutputFile() throws IOException{
			String filename = "file.txt";
			BufferedWriter out = new BufferedWriter(new FileWriter(filename));
            //System.out.println("\n*** Tokens guardados en archivo ***\n");
			for(Yytoken t: this.tokens){
				//System.out.println(t+" ");
				out.write(t + "\n");
			}
			out.close();
	}
%}
//Creamos un contador para los tokens
%init{
	tokens = new ArrayList<Yytoken>();
%init}
//Cuando se alcanza el fin del archivo de entrada
%eof{
	try{
		this.writeOutputFile();
        System.exit(0);
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}
//Activar el contador de lineas, variable yyline
%line
//Activar el contador de columna, variable yycolumn
%column
//Fin de opciones

//Expresiones regulares
//Declaraciones
comentarios = "/""/".*
coM = "/""*"
coM2= "*""/"
coment = {coM}(.)*{coM2}
delim =[" "|\t]+
SALTO=\n|\r|\r\n
DIGITO =[0-9]+
comilla ="\""
cads = "$".*"$"  //quitar formato original de cadenas por que choca con lo que esta entre comillas en el scanf "$".*"$"
igual ="="
Exp ="e"|"E"
NENTEROSP  ={DIGITO}+
NENTEROSN =\-{DIGITO}+
NREALESP ={DIGITO}*\.{DIGITO}+
NREALESN =\-{DIGITO}*\.{DIGITO}+
NEXPENTERO= -?{DIGITO}+("-")?{Exp}{DIGITO}+
mas ="+"
menos ="-"
op_unarios ="++"|"--"
llavea ="{"
llavec ="}"
LETRA =[a-zA-Z]
id =({LETRA}|"_"{LETRA})(("_"|{LETRA}|{DIGITO})?({LETRA}|{DIGITO})+)*
otroo ="*"|"/"
ampersand= "&"
//fin declaraciones

/* Seccion de reglas lexicas */
%% 
//Regla     {Acciones}

"int"|"double"|"char"|"string"|"INT"|"DOUBLE"|"CHAR"|"STRING" {
    Yytoken t = new Yytoken(1,yytext(),yyline);
    tokens.add(t);
    return t;

}
"d"|"D" {
    Yytoken t = new Yytoken(2,yytext(),yyline);
    tokens.add(t);
    return t;
}
"c"|"C" {
    Yytoken t = new Yytoken(3,yytext(),yyline);
    tokens.add(t);
    return t;
}
"s"|"S" {
    Yytoken t = new Yytoken(4,yytext(),yyline);
    tokens.add(t);
    return t;
}
"lf"|"LF" {
    Yytoken t = new Yytoken(5,yytext(),yyline);
    tokens.add(t);
    return t;
}
"for" {
    Yytoken t = new Yytoken(6,yytext(),yyline);
    tokens.add(t);
    return t;
}
"if" {
    Yytoken t = new Yytoken(7,yytext(),yyline);
    tokens.add(t);
    return t;
}
"else" {
    Yytoken t = new Yytoken(8,yytext(),yyline);
    tokens.add(t);
    return t;
}
"PROGRAM" {
    Yytoken t = new Yytoken(9,yytext(),yyline);
    tokens.add(t);
    return t;
}
"VAR" {
    Yytoken t = new Yytoken(10,yytext(),yyline);
    tokens.add(t);
    return t;
}
"BEGIN" {
    Yytoken t = new Yytoken(11,yytext(),yyline);
    tokens.add(t);
    return t;
}
"END" {
    Yytoken t = new Yytoken(12,yytext(),yyline);
    tokens.add(t);
    return t;
}
"scanf" {
    Yytoken t = new Yytoken(13,yytext(),yyline);
    tokens.add(t);
    return t;
}
"printf" {
    Yytoken t = new Yytoken(14,yytext(),yyline);
    tokens.add(t);
    return t;
}
"%" {
    Yytoken t = new Yytoken(15,yytext(),yyline);
    tokens.add(t);
    return t;
}
{id} {
    Yytoken t = new Yytoken(16,yytext(),yyline);
    System.out.println(yytext()+" 16 "+yyline);
    tokens.add(t);
    return t;
}
":" {
    Yytoken t = new Yytoken(17,yytext(),yyline);
    tokens.add(t);
    return t;
}
";" {
    Yytoken t = new Yytoken(18,yytext(),yyline);
    tokens.add(t);
    return t;
}
"(" {
    Yytoken t = new Yytoken(19,yytext(),yyline);
    tokens.add(t);
    return t;
}
")" {
    Yytoken t = new Yytoken(20,yytext(),yyline);
    tokens.add(t);
    return t;
}
"," {
    Yytoken t = new Yytoken(21,yytext(),yyline);
    tokens.add(t);
    return t;
}
{comilla} {
    Yytoken t = new Yytoken(22,yytext(),yyline);
    tokens.add(t);
    return t;
}
{igual}{igual}|"<="|">="|"<"|">"|"!=" {
    Yytoken t = new Yytoken(23,yytext(),yyline);
    tokens.add(t);
    return t;
}
{igual} {
    Yytoken t = new Yytoken(24,yytext(),yyline);
    tokens.add(t);
    return t;
}
{NENTEROSP}|{NENTEROSN}|{NREALESP}|{NREALESN}|{NEXPENTERO} {
    Yytoken t = new Yytoken(25,yytext(),yyline);
    tokens.add(t);
    return t;
}
{op_unarios} {
    Yytoken t = new Yytoken(26,yytext(),yyline);
    tokens.add(t);
    return t;
}
{llavea} {
    Yytoken t = new Yytoken(27,yytext(),yyline);
    tokens.add(t);
    return t;
}
{llavec} {
    Yytoken t = new Yytoken(28,yytext(),yyline);
    tokens.add(t);
    return t;
}
{mas} {
    Yytoken t = new Yytoken(29,yytext(),yyline);
    tokens.add(t);
    return t;
}
{menos} {
    Yytoken t = new Yytoken(30,yytext(),yyline);
    tokens.add(t);
    return t;
}
{otroo} {
    Yytoken t = new Yytoken(31,yytext(),yyline);
    tokens.add(t);
    return t;
}
{ampersand} {
    Yytoken t = new Yytoken(32,yytext(),yyline);
    tokens.add(t);
    return t;
}
{comentarios} {
}
{coment} {
}
{cads} {
	Yytoken t = new Yytoken(33,yytext(),yyline);
    tokens.add(t);
    return t;
}
{SALTO} {
}
{delim} {}
. { System.err.println("Illegal character: "+yytext()); }
