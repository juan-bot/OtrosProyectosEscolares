package ahorcado2;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ServidorHilo implements Runnable {
	private Socket cliente;

	public ServidorHilo(Socket s) {// se recibe el socket cliente
		cliente = s;
	}

	public void run() {
		// Se declaran los flujos 
		Scanner entrada = null;
		PrintWriter salida = null;
		Ahorcado juego = new Ahorcado();

		try {// se trata de generar los flujos de salida y entrada con el socket cliente
			entrada = new Scanner(new BufferedInputStream(cliente.getInputStream()));
			salida = new PrintWriter(cliente.getOutputStream());
		} catch (IOException ex) {// si hubo error al crear los flujos
			System.err.println(ex);
		}

		if (entrada != null && salida != null) {// si los flujos son correctos se inicia el juego
			juego.jugar(entrada, salida);
		}
	}

}
