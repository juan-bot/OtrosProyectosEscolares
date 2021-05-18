import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerSocketTest {
	public static void main(String[] args) {
		try {
			ServerSocket servidor = new ServerSocket(2100);
			while(true){
				try {
					Socket conexion = servidor.accept();
					OutputStreamWriter salida = new OutputStreamWriter(conexion.getOutputStream());
					salida.write("Tu estas conectado a este servidor.Adios!!!\r\n");
					conexion.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
