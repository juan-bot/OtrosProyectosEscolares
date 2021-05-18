import java.io.*;
import java.net.*;
import java.util.Scanner;

public class EchoClient {
	static private final int DEFAULT_PORT = 8189;
	static private final String DEFAULT_SERVER = "localhost";
	static private final String PROMPT = ">> ";
	static private final String SIGNOFF_TOKEN = "BYE";

	public static void main(String[] args) {

		// Declaración del socket y el flujo de salida sin inicializar
		Socket echoSocket = null;
		PrintWriter out = null;

		// prueba si pusieron argumentos en la línea de comandos
		String hostname = args.length == 0 ? DEFAULT_SERVER : args[0];

		// Flujos para leer del teclado y del flujo de entrada del socket
		Scanner socketScanner = null;
		Scanner keyboardScanner = null;

		try {
			System.out.println("Creando Socket en " + DEFAULT_PORT);

			// Se crea el socket del cliente
			echoSocket = new Socket(hostname, DEFAULT_PORT);

			// se conecta el flujo de salida del socket
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			// se conecta el flujo de entrada del socket
			socketScanner = new Scanner(echoSocket.getInputStream());
			// se conecta el teclado al flujo que lee del teclado
			keyboardScanner = new Scanner(System.in);

		} catch (UnknownHostException e) {
			System.err.println("Servidor desconocido " + hostname);
			return;
		} catch (IOException e) {
			System.err.println("Imposible obtener I/O para la conexion a " + hostname);
			return;
		}

		// lee las instrucciones enviadas por el servidor
		String instructionsFromServer = socketScanner.nextLine();
		System.out.println(instructionsFromServer);

		// bandera para controlar el ciclo que interactúa con el servidor
		boolean done = false;

		// entrada desde el teclado
		String userInput = "";

		// repite ciclo mientas no encuentre el fin del flujo en el teclado o
		// no han escrito la palabra bye
		while (userInput != null && !done) {
			// muestra >> para indicar un prompt en la salida
			System.out.print(PROMPT);
			// Lee la línea introducida por el usuario desde el teclado
			userInput = keyboardScanner.nextLine();
			if (userInput == null) {// si se ingreso el fin del flujo, esto
									// depende del SO
				done = true;
			} else {
				// revisa si se ingreso la palabra bye
				if (userInput.trim().toUpperCase().startsWith(SIGNOFF_TOKEN)) {
					done = true;
				}
				// Envia la entrada del teclado por el socket hacia el servidor
				out.println(userInput);

				// Lee la respuesta del servidor
				String fromServer = socketScanner.nextLine();
				// muestra en la salida la respuesta del servidor
				System.out.println("Server reply: " + fromServer);
			}
		}
		// Aquí se realizan las labores de limpieza, cerrar flujos y sockets
		try {
			echoSocket.close();
		} catch (java.io.IOException eio) {
			System.err.println(eio);
		}
	}

}
