package ahorcado2;

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
			String linea, usuario;
			PrintWriter salida = null;
			Scanner entrada = null;
			Scanner teclado = new Scanner(System.in);
			// se crea un flujo de salida para enviar la respuesta
			salida = new PrintWriter(s.getOutputStream());
			//con el cliente conectado ahora conecta el flujo del Scanner con el del socket
			entrada = new Scanner(s.getInputStream());
			boolean terminar = false;
			while (!terminar) {
				linea = entrada.nextLine();//obtiene la informacion a imprimir del ahorcado() 
				System.out.println("cliente "+linea);//se imprime la palabra con los caracteres que va descubriendo
				// si el numero de intentos se acabo o se completo la palabra se termina el juego
				if (linea.trim().toUpperCase().startsWith("LASTIMA")|| 
						linea.trim().toUpperCase().startsWith("FELICIDADES")) {
					terminar = true;
				}
				if (!terminar) {//si ahun no ha acabado el juego
					System.out.print(">>");
					usuario = teclado.nextLine();// obtiene la letra del teclado
					salida.println(usuario); // la manda al flujo del juego para que la valide
					salida.flush();// fuerza la operacion
				}
			}

		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
