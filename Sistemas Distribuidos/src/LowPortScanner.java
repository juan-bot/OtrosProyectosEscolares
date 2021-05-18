import java.net.*;
import java.io.*;
import java.net.Socket;
public class LowPortScanner {
	public static void main(String[] args) {
		String host = "www.utm.mx";// nombre del host por defecto

		// probamos si se ha introducido el nombre del host desde la línea de
		// comandos
		if (args.length > 0) {
			host = args[0];
		}
		// con este ciclo se abre un socket por cada puerto menor a 1024
		for (int i = 0; i <= 1024; i++) {
			try {
				Socket s = new Socket(host, i);
				System.out.println("Hay un servidor en el puerto " + i + " de " + host);
				s.close();
			} catch (UnknownHostException ex) {// el host no existe
				System.err.println("el host no existe "+i+" "+ ex);
				break;
			} catch (IOException ex) {
				//System.out.println("no se pudo abrir el puerto:"+i+"  "+ex);
				// No se pudo abrir el puerto y no se reporta en la salida
			}
		}
	}

}
