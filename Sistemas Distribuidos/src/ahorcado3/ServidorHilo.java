package ahorcado3;

import java.net.*;
import java.io.*;
import java.util.*;
//es igual
public class ServidorHilo implements Runnable {
	private Socket cliente;

	public ServidorHilo(Socket s) {
		cliente = s;
	}

	public void run() {
		Scanner entrada = null;
		PrintWriter salida = null;
		Ahorcado juego = new Ahorcado();

		try {
			entrada = new Scanner(new BufferedInputStream(cliente.getInputStream()));
			salida = new PrintWriter(cliente.getOutputStream());
		} catch (IOException ex) {
			System.err.println(ex);
		}

		if (entrada != null && salida != null) {
			juego.jugar(entrada, salida);
		}
	}

}
