package ahorcado3;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class Ahorcado {
	private ArrayList<String> lst = new ArrayList<String>();
	private String palabra;
	char[] oculta;

	private void cargarPalabras() {
		String linea;
		try {
			BufferedReader archivo = new BufferedReader(new FileReader("C:\\Users\\The_l\\workspace\\Sistemas Distribuidos\\src\\archivo.txt"));
			while ((linea = archivo.readLine()) != null) {// lee todas las palabras del archivo mientras halla
				lst.add(new String(linea));// agrega cada palabra a un arreglo de listas
				System.out.println(linea);// imprime las palabras del archivo
			}
		} catch (FileNotFoundException ex) {// si hubo algun error al abrir el archivo
			System.err.println(ex);
		} catch (IOException ex) {
			System.err.println(ex);
		}
	}
	//se escoge una palabra al azar del arreglo y la devuelve
	private String eligePalabra() {
		int pos, tam;
		tam = lst.size();
		Random generador = new Random();
		do {
			pos = generador.nextInt() % tam;// se genera la posicion del arreglo
		} while (pos < 0);
		return new String(lst.get(pos));// regresa una cadena con la palabra elegida
	}

	private void ocultar() {// crea una cadena con * de acurdo al tamaño de la palabra oculta
		oculta = palabra.toCharArray();
		for (int i = 0; i < oculta.length; i++)
			oculta[i] = '*';
	}
	// verifica si la letra ingresada pertenece a la palabra oculta
	private boolean adivina(char l) {
		boolean res = false;

		for (int i = 0; i < oculta.length; i++)
			if (palabra.toCharArray()[i] == l) {
				oculta[i] = l;
				res = true;
			}

		return res;
	}
	// el juego recibe los flujos de entrada y salida del cliente
	public void jugar(Scanner entrada, PrintWriter salida) {
		// se inicializa el estado del juego
		boolean ganador = false;
		boolean correcto;
		int vidas = 5;
		String linea, parcial, mensaje;
		char letra;
		cargarPalabras();
		palabra = eligePalabra();
		System.out.println("Se eligio la palabra " + palabra);

		ocultar();
		ganador = false;
		salida.println(new String(oculta));
		salida.flush();
		salida.println("sigue");
		salida.flush();
		while (!ganador && vidas > 0) {
			linea = entrada.nextLine();// recibe del cliente la letra
			System.out.println("Se recibio la siguiente entrada del cliente " + linea);
			letra = linea.toCharArray()[0];//convierte a cadena el primer caracter 
			correcto = adivina(letra);// valida si la letra corresponde a la palabra
			parcial = new String(oculta);
			if (!correcto) // si la letra no es correcta decrementan el numero de vidas
				vidas--;
			else {
				if (palabra.equals(parcial)) {// si se completo la palabra se gano el juego
					ganador = true;
				}
			}
			mensaje = "vidas = " + vidas + " " + parcial;// se crea el estado del juego del cliente
			salida.println(mensaje);//manda el mensaje al cliente con la info
			salida.flush();// fuerza al hardware a escribir en el flujo
			System.out.println(mensaje);
			if (ganador || vidas == 0) {// si se acabo el juego
				salida.println("termina");//manda el mensaje al cliente 
				salida.flush();// fuerza al hardware a escribir en el flujo
				System.out.println("termina");
			} else {// si el juego no se ha acabado
				salida.println("sigue");//manda el mensaje al cliente 
				salida.flush();// fuerza al hardware a escribir en el flujo
				System.out.println("sigue");
			}
		}
		// se valida el estado del cliente 
		if (ganador)
			salida.println("Felicidades ganaste!!!");
		else
			salida.println("Lastima Margarito, la palabra era " + palabra);
		salida.flush();// fuerza la operacion
		System.out.println("Juego terminado");
	}

}
