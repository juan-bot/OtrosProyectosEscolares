package echoServer;

import java.io.*;
import java.net.*;
import java.util.Scanner;

public class EcoCliente {
	static private final int DEFAULT_PORT = 1390; // puerto por el cual se tratara de conectar el cliente
	static private final String DEFAULT_SERVER = "localhost";
	static private final String PROMPT = ">> ";
	static private final String SIGNOFF_TOKEN = "BYE"; // token para finalizar
														// al cliente

	public static void main(String[] args) {
		// Se declaran los objetos sin inicializar
		Socket echoSocket = null;
		PrintWriter out = null;

		String hostname = args.length == 0 ? DEFAULT_SERVER : args[0];
		// Se declaran los objetos sin inicializar
		Scanner socketScanner = null;
		Scanner keyboardScanner = null;
		try {
			System.out.println("Creando socket en el puerto " + DEFAULT_PORT);
			echoSocket = new Socket(hostname, DEFAULT_PORT); // se crea el
																// socket
			System.out.println("El cliente se conecto con el servidor");
			// se crea un flujo de salida para enviar la respuesta
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			//con el cliente conectado ahora conecta el flujo del Scanner con el del socket
			socketScanner = new Scanner(echoSocket.getInputStream());
			keyboardScanner = new Scanner(System.in); // obtine un dato del teclado para mandarla al servidor
			System.out.println("Se crearon todos los flujos");
		} catch (UnknownHostException e) {
			System.err.println("No se conoce al host " + hostname);
			return;
		} catch (IOException e) {
			System.err.println("No se pudieron crear los flujos para " + hostname);
			return;
		}

		String instructionsFromServer = socketScanner.nextLine(); //convierte en una cadena la instruccion
		System.out.println(instructionsFromServer);// imprime la instruccion
		boolean done = false; //bandera de realizado se inicializa con falso
		String userInput = ""; // se inicializa la variable como vacia
		while (userInput != null && !done) { //recibe una cadena hasta que ingrese la palabra BYE
			System.out.print(PROMPT); // imprime >> para que el usuario ingrese una cadena
			userInput = keyboardScanner.nextLine();//convierte el mensaje en cadena
			if (userInput == null) { //si no se ingreso nada
				done = true; 
			} else {
				if (userInput.trim().toUpperCase().startsWith(SIGNOFF_TOKEN)) {// si ingreso la palabra BYE
					done = true;
				}
				out.println(userInput); // le manda la cadena al echo server
				String fromServer = socketScanner.nextLine(); // obtiene la respuesta del echo server y la imprime
				System.out.println("Respuesta del servidor: " + fromServer);
			}
		}

		try {// se cierran los flujos y el socket
			echoSocket.close();
		} catch (java.io.IOException eio) {
			System.err.println(eio);
		}
	}

}
