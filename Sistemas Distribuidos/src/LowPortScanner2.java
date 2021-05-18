//usar un objeto de la clase InetAddress para investigar cual es la dirección que corresponde a un determinado host
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

public class LowPortScanner2 {
	public static void main(String[] args) {
		try{
			InetAddress virtual = InetAddress.getByName("www.utm.mx");
			for (int i = 0; i <= 1024; i++) {// recorremos todos los puertos del sistema
				try {
					Socket socketVirtual = new Socket(virtual, i); // obtener direccion ip 
					System.out.println("Hay un servidor en el puerto " + i + " de " + virtual);
					socketVirtual.close();
				} catch (UnknownHostException ex) {// el host no existe
					System.err.println("el host no existe "+i+" "+ ex);
					break;
				} catch (IOException ex) {
					//System.out.println("no se pudo abrir el puerto:"+i+"  "+ex);
					// No se pudo abrir el puerto y no se reporta en la salida
				}
			}
			
		}
		catch(UnknownHostException ex){//host desconocido
			System.err.println(ex);
		}
		catch(IOException ex){
			System.err.println(ex);
		}

	}
}
