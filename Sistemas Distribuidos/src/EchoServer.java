import java.io.*;
import java.net.*;
import java.util.Scanner;

public class EchoServer {
	// Notese que el numero de puerto es mayor a 1024
	static private final int DEFAULT_PORT = 8189;
	// cuando el cliente envia esta cadena el servidor cierra la conexión
	static private final String SIGN_OFF_TOKEN = "BYE";

	public static void main(String[] args) {
		// Se declaran los objetos sin inicializar
		ServerSocket serverSocket = null;
		Socket clientSocket = null;

		try {
			System.out.println("Creando un socket en el puerto " + DEFAULT_PORT);
			// aquí se crea el socket usando el puerto por defecto que definimos
			// antes
			serverSocket = new ServerSocket(DEFAULT_PORT);
			// aquí se declara un flujo de tipo Scanner pero no está conectado
			Scanner socketScanner = null;

			while (true) {// Ciclo infinito del servidor para atender más de un
							// cliente

				System.out.println("Estoy esperando un cliente. CQ, CQ, CQ!");

				// en esta línea está esperando a que un cliente se conecte
				clientSocket = serverSocket.accept();

				System.out.println("Client connected");
				// con el cliente conectado ahora conecta el flujo del Scanner
				// con el
				// del socket
				socketScanner = new Scanner(clientSocket.getInputStream());

				// en este par de líneas crea un flujo de salida para enviar la
				// //respuesta al cliente
				OutputStream outputStream = clientSocket.getOutputStream();
				PrintWriter outputToClient = new PrintWriter(outputStream, true);

				// Instruye al usuario del cliente que para salir deberá enviar
				// bye.
				outputToClient.println("Hola! Usa bye para salir.");

				// usa esta bandera para controlar la lectura en el flujo de
				// entrada
				boolean done = false;
				while (!done) {
					// Leer los datos del cliente línea por línea
					String line = socketScanner.nextLine();
					if (line == null) {
						done = true;
					} else {
						// muestra un mensaje en la salida del servidor
						System.out.println("Linea enviada por el cliente: " + line);

						// prueba si la cadena de control esta presente
						if (line.trim().toUpperCase().startsWith(SIGN_OFF_TOKEN)) {
							// envia aviso al cliente de la desconexión
							outputToClient.println("Adios, Vuelve pronto!");
							System.out.println("Client signed off");
							done = true;
						} else {
							// Devuelve la línea que envió el cliente
							outputToClient.println(line);
						}
					}
				}
				continue; // Busca un Nuevo cliente
			}
		} catch (Exception e) {
			System.err.println(e);
		} catch (Throwable t) {
			System.err.println("Caught throwable t: " + t);
		} finally {
			if (serverSocket != null) {
				System.out.println("Instruccion para limpiar antes de salir");
				try {
					System.out.println("Limpieza , cerrando sockets");
					serverSocket.close();
					if (clientSocket != null) {
						clientSocket.close();
					}
				} catch (IOException eio) {
				}
			}
		}
	}

}
