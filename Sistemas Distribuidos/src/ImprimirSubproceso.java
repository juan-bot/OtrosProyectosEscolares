
public class ImprimirSubproceso extends Thread{
	public ImprimirSubproceso(String nombre){
		super(nombre);
	}
	
	public void run(){
		
		//imprime mensaje que indica cuando se inicia un hilo
		System.out.println(getName() + " inicia su actividad");
		
		//ciclo que deber�n realizar los hilos
		for(int i = 0; i < 150; i++)
			System.out.println(getName() + " i = " + i);
			
		//mensaje que muestra en qu� momento se termina la ejecuci�n de un hilo
		System.out.println(getName() + " termino su actividad");
	}

}
