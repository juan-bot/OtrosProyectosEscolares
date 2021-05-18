//investigar cual es el puerto al cual está conectado un socket en particular en el extremo del servidor y en el extremo local por medio de los métodos getPort() y getLocalPort() 
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class LowPortScanner3 {
	public static void main(String[] args) {
		// con este ciclo se abre un socket por cada puerto menor a 1024
		for (int i = 0; i <= 1024; i++) {// recorremos todos los puertos del sistema
			try {
				Socket socketVirtual = new Socket("www.utm.mx", i); 
				int puertoServidor = socketVirtual.getPort(); // obtenemos el puerto por el cual esta conectado el socket al extremo del servidor
				System.out.println("Conectado al servidor  por el Puerto " + puertoServidor);
				int puertoLocal = socketVirtual.getLocalPort();// obtenemos el puerto por el cual esta conectado el socket al extremo local del servidor
				System.out.println("Conectado en el cliente por el Puerto " + puertoLocal);
				socketVirtual.close();

			} catch (UnknownHostException ex) {// el host no existe
				System.err.println("el host no existe "+i+" "+ ex);
				break;
			} catch (IOException ex) {
				System.out.println("no se pudo abrir el puerto:"+i+"  "+ex);
				// No se pudo abrir el puerto y no se reporta en la salida
			}
		}
	}
}
