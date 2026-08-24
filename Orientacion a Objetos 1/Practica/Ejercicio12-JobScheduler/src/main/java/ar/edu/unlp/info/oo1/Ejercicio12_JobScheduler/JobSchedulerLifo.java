package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

public class JobSchedulerLifo extends JobScheduler{
	
	
	public JobDescription getNext() {
		return this.jobs.get(jobs.size()-1);
	}


}
