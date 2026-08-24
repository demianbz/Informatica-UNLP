package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

public class JobSchedulerHighestPriority extends JobScheduler{

	public JobDescription getNext() {
		return this.jobs.stream()
		        .max((j1,j2) -> Double.compare(j1.getPriority(), j2.getPriority()))
		        .orElse(null);
	}		
	



}
