package ar.edu.unlp.info.oo1.Ejercicio12_JobScheduler;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;


import org.junit.jupiter.api.BeforeEach;


public class JobSchedulerTest {
    protected JobDescription firstJob;
    protected JobDescription highestPriorityJob;
    protected JobDescription mostEffortJob;
    protected JobDescription lastJob;

    private void initializeJobs() {

        firstJob = new JobDescription (1, 1, "Este es el primero");
        highestPriorityJob = new JobDescription (1, 100, "Este es el de más prioridad");
        mostEffortJob = new JobDescription (100, 1, "Este es el de más esfuerzo");
        lastJob = new JobDescription (1, 1, "Este es el último");
    }

    @BeforeEach
    void setUp() {
        this.initializeJobs();
    }


    private void scheduleJobsIn(JobScheduler aJobScheduler) {
        aJobScheduler.schedule(firstJob);
        aJobScheduler.schedule(highestPriorityJob);
        aJobScheduler.schedule(mostEffortJob);
        aJobScheduler.schedule(lastJob);
    }

    @Test
    void testSchedule() {
        JobScheduler aScheduler = new JobSchedulerFifo();
        aScheduler.schedule(highestPriorityJob);
        assertTrue(aScheduler.getJobs().contains(highestPriorityJob));
    }

    @Test
    void testUnschedule() {
        JobScheduler aScheduler = new JobSchedulerFifo();
        this.scheduleJobsIn(aScheduler);
        aScheduler.unschedule(highestPriorityJob);
        assertFalse(aScheduler.getJobs().contains(highestPriorityJob));
    }

    
    @Test
    void testNextReturnsFirstJob() {
        JobScheduler scheduler = new JobSchedulerFifo();

        this.scheduleJobsIn(scheduler);

        assertEquals(firstJob, scheduler.next());
    }
    
    
    @Test
    void testNextReturnsLastJob() {
        JobScheduler scheduler = new JobSchedulerLifo();

        this.scheduleJobsIn(scheduler);

        assertEquals(lastJob, scheduler.next());
    }
    
    
    @Test
    void testNextReturnsHighestPriorityJob() {
        JobScheduler scheduler = new JobSchedulerHighestPriority();

        this.scheduleJobsIn(scheduler);

        assertEquals(highestPriorityJob, scheduler.next());
    }
    
    
    @Test
    void testNextRemovesJobFromCollection() {
        JobScheduler scheduler = new JobSchedulerFifo();

        this.scheduleJobsIn(scheduler);

        scheduler.next();

        assertFalse(scheduler.getJobs().contains(firstJob));
    }
    
    

}
