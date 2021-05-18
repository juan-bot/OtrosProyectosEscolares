import java.util.*;
import java.io.*;

public class Ahorcado {
	public static void main(String[] args) {
		// variables para indicar el tamaño del contenedor y la posicion de la
		// palabra
		int tam, pos;

		// variable para leer una linea del archivo
		String linea;

		// Contenedor tipo lista implementada con arreglos
		ArrayList<String> lst = new ArrayList<String>();

		// segmento para abrir un archivo de texto y leer las palabras
		try {
			BufferedReader archivo = new BufferedReader(new FileReader("C:\\Users\\The_l\\workspace\\Sistemas Distribuidos\\src\\archivo.txt"));

			// ciclo para leer hasta el final del archivo
			while ((linea = archivo.readLine()) != null) {
				lst.add(new String(linea));
				System.out.println(linea);
			}

			// Se deben atrapar las excepciones de los flujos
		} catch (FileNotFoundException ex) {
			System.err.println(ex);
		} catch (IOException ex) {
			System.err.println(ex);
		}

		// Se obtiene el tamaño del contenedor para calcular el rango de
		// posiciones
		tam = lst.size();

		// Se genera una posicion para elegir una palabra al azar
		Random generador = new Random();
		do {
			pos = generador.nextInt() % tam;
		} while (pos < 0);

		// Se recupera la palabra del contenedor
		String palabra = new String(lst.get(pos));

		// Se convierte en un arreglo de char para su fácil manejo
		char[] usuario = palabra.toCharArray();

		// Se oculta la palabra sustituyendo sus caracteres con *
		for (int i = 0; i < palabra.length(); i++)
			usuario[i] = '*';

		// Se muestra la palabra oculta al usuario
		System.out.println(new String(usuario));

		// banderas para controlar las oportunidades de adivinar la palabra
		boolean correcto = false;
		boolean chance;

		// variable para controlar los intentos incorrectos
		int intentos = 0;

		// ciclo principal para adivinar la palabra
		while ((intentos < 5) && (correcto == false)) {
			// Prompt para la lectura
			System.out.println(">>");

			// Flujo hacia el teclado
			Scanner teclado = new Scanner(System.in);

			// Lee la entrada del teclado hasta que aparezca el enter
			String lectura = teclado.nextLine();

			// Lo convertimos en un arreglo de char
			char[] letra = lectura.toCharArray();

			// bandera que indica si la letra está en la palabra
			chance = false;

			// busca las ocurrencias de la letra y la sustituye en la cadena de
			// *
			for (int i = 0; i < palabra.length(); i++) {
				if (palabra.charAt(i) == letra[0]) {
					usuario[i] = letra[0];
					chance = true;
				}
			}

			// La convierte en String para compararla con la palabra original
			String nueva = new String(usuario);
			if (palabra.equals(nueva))
				correcto = true;

			// Si no adivino una letra incrementa intentos erroneos
			if (!chance)
				intentos++;
			System.out.println(nueva + " intentos fallidos = " + intentos);
		}

		// Determina si gano o perdio el jugador
		if (correcto)
			System.out.println("Felicidades");
		else
			System.out.println("Lastima Margarito, la palabra era " + palabra);
	}

}
