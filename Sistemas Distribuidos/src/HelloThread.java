
public class HelloThread extends Thread {
	public void run() {
		System.out.println("Hola Soy un Hilo!");
	}

	public static void main(String[] args) {
		(new HelloThread()).start();
	}

}
