package productorConsumidor;

public class Consumidor extends Thread{
	private Bufer variableCompartida;

	public Consumidor(Bufer compartido) {
		super("Consumidor");
		variableCompartida = compartido;
	}

	public void run() {
		int suma = 0;

		for (int cuenta = 1; cuenta <= 4; cuenta++) {
			try {
				Thread.sleep((int) (Math.random() * 3001));
				suma += variableCompartida.obtener();
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}

		System.out.println(
				getName() + " leyo los valores, para un total de: " + suma + "\nTerminando " + getName() + ".");
	}

}
