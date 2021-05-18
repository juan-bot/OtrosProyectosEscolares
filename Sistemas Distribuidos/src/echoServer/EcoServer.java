package echoServer;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class EcoServer {
	
	private static final int puerto = 1390; //puerto por el cual se abrira el socket
	// Se declaran los objetos sin inicializar
	private static ServerSocket servidor = null;
	private static Socket cliente = null;
	
	public static void main(String[] args) {
		try{
			// se crea el socket usando el puerto 1390
			servidor = new ServerSocket(puerto);
			System.out.println("El servidor esta escuchando en el puerto " + puerto + ".");
		}catch(IOException ex){ // si hubo algun error al crear el socket
			System.err.println(ex);
		}
		while(true){ //lazo infinito para poder atender a mas de un cliente
			if(servidor != null){//si hay un cliente en ese puerto
				try{ //se trata de conectar al cliente
					cliente = servidor.accept();// acepta al cliente y devuelve el socket
					System.out.println("El cliente se conecto.");
					EcoServerThread hilo = new EcoServerThread(cliente); //se crea un hilo con el flujo del socket
					System.out.println("Iniciando un nuevo hilo.");
					hilo.start(); //inicia el hilo para atender al cliente, ejecuta el metodo run
				}catch(IOException ex){
					System.err.println(ex);
				}
			}
		}
	}

}
