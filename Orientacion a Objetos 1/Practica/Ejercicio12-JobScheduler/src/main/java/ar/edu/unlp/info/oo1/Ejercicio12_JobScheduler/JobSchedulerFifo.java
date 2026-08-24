package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

public class JobSchedulerFifo extends JobScheduler {
	
    public JobDescription getNext() {
        return jobs.get(0);
    }
    
    
    
}
