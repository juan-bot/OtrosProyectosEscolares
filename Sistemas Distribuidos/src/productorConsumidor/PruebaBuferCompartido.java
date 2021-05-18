package productorConsumidor;

public class PruebaBuferCompartido {
	public static void main(String[] args) {

		/*
		 * Bufer variableCompartida = new BuferNoSincronizado();
		 * 
		 * Productor productor = new Productor(variableCompartida); Consumidor
		 * consumidor = new Consumidor(variableCompartida);
		 * 
		 * productor.start(); consumidor.start();
		 */
		BuferSincronizado variableCompartida = new BuferSincronizado();

		StringBuffer encabezadosColumna = new StringBuffer("Operacion");
		encabezadosColumna.setLength(40);
		encabezadosColumna.append("Bufer\t\tCuenta ocupado");
		System.out.println(encabezadosColumna);
		System.out.println();
		variableCompartida.mostrarEstado("Estado inicial");

		Productor productor = new Productor(variableCompartida);
		Consumidor consumidor = new Consumidor(variableCompartida);

		productor.start();
		consumidor.start();

	}

}
