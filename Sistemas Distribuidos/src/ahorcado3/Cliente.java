package ahorcado3;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class Cliente {
	private static Socket s = null;

	public static void main(String[] args) {

		try {
			s = new Socket("localhost", 1390); // puerto por el cual se tratara de conectar el cliente
			System.out.println("Se conecto con el servidor");
			// Se declaran los flujos sin inicializar
			String linea, usuario, comando;
			PrintWriter salida = null;
			Scanner entrada = null;
			Scanner teclado = new Scanner(System.in);
			// se crean los flujos de entrada y salida
			salida = new PrintWriter(s.getOutputStream());
			entrada = new Scanner(s.getInputStream());
			boolean terminar = false;
			while (!terminar) {
				linea = entrada.nextLine();//obtiene la informacion a imprimir del ahorcado() 
				System.out.println(linea);//se imprime la palabra con los caracteres que va descubriendo
				comando = entrada.nextLine();// recibe la cadena del estado del juego
				System.out.println(comando);
				if (comando.trim().toUpperCase().startsWith("TERMINA")) {//si el juego se acabo
					terminar = true;
				}
				if (!terminar) {//si ahun no ha acabado el juego
					System.out.print(">>");
					usuario = teclado.nextLine();// obtiene la letra del teclado
					salida.println(usuario);// la manda al flujo del juego para que la valide
					salida.flush();// fuerza la operacion
				}
			}
			// recibe un mensaje de haber perdido o ganado el juego y la imprime
			linea = entrada.nextLine();
			System.out.println(linea);

		} catch (UnknownHostException e) {// error al crear el socket
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
