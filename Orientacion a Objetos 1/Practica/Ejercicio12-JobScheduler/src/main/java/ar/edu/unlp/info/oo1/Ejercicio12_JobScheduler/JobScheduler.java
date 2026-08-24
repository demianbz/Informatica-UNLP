package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

import java.util.ArrayList;
import java.util.List;

public abstract class JobScheduler {
	 protected List<JobDescription> jobs;

	    public JobScheduler () {
	        this.jobs = new ArrayList<>();
	    }

	    //Recibe un trabajo y lo agrega al final de la coleccion de trabajos pendientes
	    public void schedule(JobDescription job) {
	        this.jobs.add(job);
	    }

	    public void unschedule(JobDescription job) {
	        if (job != null) {
	            this.jobs.remove(job);
	        }
	    }

	    public List<JobDescription> getJobs(){
	        return jobs;
	    }

	    abstract public JobDescription getNext();

	    //Determina cual es el siguiente trabajo de la coleccion que debe ser atendido, lo retorna y lo quita de la coleccion
	    public JobDescription next() {
	    	//Controlo que la lista no este vacia por las dudas(creo que el ejercicio no lo pide igual)
	    	if(this.jobs.isEmpty()) {
	    		return null;
	    	}
	    	
	        JobDescription nextJob = this.getNext();
	        this.unschedule(nextJob);
	        return nextJob;
	    }
	    


}
