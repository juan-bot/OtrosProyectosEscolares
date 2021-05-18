package ahorcado3;

import java.net.*;
import java.io.*;
import java.util.*;
//es igual
public class Servidor{
	private static ServerSocket servidor = null;
	private static Socket cliente = null;
	private static final int puerto = 1390;
	
	public static void main(String[] args){
		try{
			servidor = new ServerSocket(puerto);
		}catch(IOException e){
			System.err.println(e);
		}
		while(true){
			if(servidor != null){
				try{
					cliente = servidor.accept();
					System.out.println("Se conecto un cliente");
				}catch(IOException e){
					System.err.println(e);
				}
				if(cliente != null){
					Thread hilo = new Thread(new ServidorHilo(cliente));
					hilo.start();
				}
			}
			
		}
	}

	
}
