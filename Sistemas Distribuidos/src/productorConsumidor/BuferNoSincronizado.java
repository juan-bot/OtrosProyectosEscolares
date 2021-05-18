package productorConsumidor;

public class BuferNoSincronizado implements Bufer {
	/*
	 * private int bufer = -1;
	 * 
	 * public void establecer(int valor) {
	 * 
	 * System.out.println(Thread.currentThread().getName() + " escribe " +
	 * valor);
	 * 
	 * bufer = valor;
	 * 
	 * }
	 * 
	 * public int obtener() {
	 * 
	 * System.out.println(Thread.currentThread().getName() + " lee " + bufer);
	 * 
	 * return bufer;
	 * 
	 * }
	 */
	private int bufer = -1;
	private int cuentaBuferOcupado = 0;

	public synchronized void establecer(int valor) {
		String nombre = Thread.currentThread().getName();

		while (cuentaBuferOcupado == 1) {
			try {
				System.out.println(nombre + " trata de escribir.");
				mostrarEstado("Bufer lleno. " + nombre + " espera.");
				wait();
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}

		bufer = valor;

		++cuentaBuferOcupado;

		mostrarEstado(nombre + " escribe " + bufer);

		notify();

	}

	public synchronized int obtener() {

		String nombre = Thread.currentThread().getName();

		while (cuentaBuferOcupado == 0) {
			try {
				System.out.println(nombre + " trata de leer.");
				mostrarEstado("Bufer vacio. " + nombre + "espera.");
				wait();
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}

		--cuentaBuferOcupado;

		mostrarEstado(nombre + " lee " + bufer);

		notify();

		return bufer;

	}

	public void mostrarEstado(String operacion) {
		StringBuffer lineaSalida = new StringBuffer(operacion);
		lineaSalida.setLength(40);
		lineaSalida.append(bufer + "\t\t" + cuentaBuferOcupado);
		System.out.println(lineaSalida);
		System.out.println();
	}

}
