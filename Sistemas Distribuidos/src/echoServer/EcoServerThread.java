package echoServer;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class EcoServerThread extends Thread{
	static private final String SIGN_OFF_TOKEN = "BYE";
	static private Socket socketCliente = null;
	
	public EcoServerThread(Socket s){
		socketCliente = s;
	}
	
	public void run(){
		Scanner entrada = null;
		PrintWriter salida = null;
		
		try{
			if(socketCliente != null){ // si el socket es valido
				// se conectan los flujos  
				entrada = new Scanner(socketCliente.getInputStream());
				salida = new PrintWriter(socketCliente.getOutputStream());
			}
		}catch(IOException ex){
			System.err.println(ex); // se imprimen los errores 
		}

		if(entrada != null && salida != null){
			boolean terminado = false;
			System.out.println("Los flujos del hilo estan abiertos.");
			salida.println("Hola cliente, para salir ingresa la palabra BYE.");
			salida.flush(); // forza la operacion de lectura
			while(!terminado){
				String linea = entrada.nextLine();
				if(linea == null){ //si la cadena recibida es nula se repite el ciclo
					terminado = true;
				}else{
					System.out.println("El cliente envio: " + linea);
					if(linea.trim().toUpperCase().startsWith(SIGN_OFF_TOKEN)){ // si ingreso la palabra BYE
						salida.println("Adios, Adios, Vuelve pronto!");
						salida.flush(); //fuerza la escritura
						System.out.println("El cliente se desconecto");
						terminado = true;
					}else{ //si ingreso una cadena valida la manda como respuesta
						salida.println(linea);
						salida.flush();//fuerza la escritura
					}
				}
			}
		}
	}

}
