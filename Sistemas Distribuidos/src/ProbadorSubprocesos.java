
public class ProbadorSubprocesos {
	public static void main(String[] args) {

		// Tres hilos que imprimen el contador del ciclo for
		ImprimirSubproceso subproceso1 = new ImprimirSubproceso("subproceso1");
		ImprimirSubproceso subproceso2 = new ImprimirSubproceso("subproceso2");
		ImprimirSubproceso subproceso3 = new ImprimirSubproceso("subproceso3");

		System.out.println("Iniciando subprocesos");

		// se solicita la ejecución de los hilos
		subproceso1.start();
		subproceso2.start();
		subproceso3.start();

		System.out.println("Subprocesos iniciados, termina main");
	}

}
