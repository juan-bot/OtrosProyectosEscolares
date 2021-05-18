package productorConsumidor;

public class Productor extends Thread {
	private Bufer variableCompartida;

	public Productor(Bufer compartido) {

		super("Productor");
		variableCompartida = compartido;
	}
	public void run() {	
		for (int cuenta = 1; cuenta <= 4; cuenta++) {
			try {
				Thread.sleep((int) (Math.random() * 3001));
				variableCompartida.establecer(cuenta);
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}

		System.out.println(getName() + " termino de producir." + "\nTerminando " + getName() + ".");
	}
}