import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.io.PrintStream;

public class PipeDemo extends Thread{
	//esta es la tubería que comparten los dos hilos
		//main y el hilo creado en el programa
		PipedOutputStream output;
		// Un constructor con el que pasa por parametro el objeto compartido
		public PipeDemo(PipedOutputStream out){
			// se copia el parametro en la variable compartida
			output = out;
		}
		
		public static void main (String args[]){
			try{
				// Se crea un tuberia para escribir
				PipedOutputStream pout = new PipedOutputStream();

				// Se crea una tuberia para leer y se conecta
				// con la tuberia que escribe
				PipedInputStream pin = new PipedInputStream(pout);
				
				// Se crea un nuevo hilo para escribir en la tuberia
				PipeDemo pipedemo = new PipeDemo(pout);
				
				// Arrancar el hilo
				pipedemo.start();
				
				// Se lee de la tuberia desde main
				int input = pin.read();
				// Comprobar que el hilo main esta activo
				System.out.println(Thread.currentThread().getName() + " esta activo.");
				
				// ciclo para leer los datos puestos en la tuberia por el hilo pipedemo
				// hasta el final del flujo
				while (input != -1){
					// Mostrar los datos en la salida
					System.out.print ( (char) input);
					// leer el siguiente dato
					input = pin.read();
				}
				
			}catch (Exception e){
				System.err.println ("Error en la tuberia " + e);
			}
		}
		
		//aquí se pone el código que deberá ejecutar el hilo pipedemo
		public void run(){
			try{

				// Crea un flujo para darle formato a la salida y lo conecta a la tuberia
				PrintStream p = new PrintStream( output );
				
				// Comprobar que se esta dentro de pipedemo y no de main
				System.out.println(Thread.currentThread().getName() + " esta activo.");
				
				// Envia un mensaje por la tuberia
				p.println (Thread.currentThread().getName() + 
				" dice: Hola desde otro Hilo!!");
				
				// Cerrar el flujo
				p.close();
			}catch (Exception e){
				// no hacer nada
			}
		}

}
