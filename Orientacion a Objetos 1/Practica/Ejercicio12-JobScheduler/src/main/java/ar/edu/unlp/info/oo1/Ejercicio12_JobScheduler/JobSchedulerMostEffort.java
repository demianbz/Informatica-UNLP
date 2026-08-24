package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

public class JobSchedulerMostEffort extends JobScheduler{
	
	public JobDescription getNext() {
		return this.jobs.stream()
		        .max((j1,j2) -> Double.compare(j1.getEffort(), j2.getEffort()))
		        .orElse(null);
	}
	


}
