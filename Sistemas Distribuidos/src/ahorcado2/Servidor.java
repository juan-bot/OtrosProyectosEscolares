package ahorcado2;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Servidor {
	private static ServerSocket servidor = null;
	private static Socket cliente = null;
	private static final int puerto = 1390;
	
	public static void main(String[] args){
		try{// se crea el socket usando el puerto 1390
			servidor = new ServerSocket(puerto);
		}catch(IOException e){// si hubo algun error al crear el socket
			System.err.println(e);
		}
		while(true){//lazo infinito para poder atender a mas de un cliente
			if(servidor != null){//si hay un cliente en ese puerto
				try{//se trata de conectar al cliente
					cliente = servidor.accept();// acepta al cliente y devuelve un socket
					System.out.println("Se conecto un cliente");
				}catch(IOException e){// si hubo algun error al aceptar al cliente
					System.err.println(e);
				}
				if(cliente != null){// si el cliente se conecto satisfactoriamente
					// se crea un hilo
			//inicia el hilo para atender al cliente, ejecuta el metodo run
					Thread hilo = new Thread(new ServidorHilo(cliente));
					hilo.start();
				}
			}
			
		}
	}

}

