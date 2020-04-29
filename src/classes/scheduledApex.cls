global class scheduledApex implements Schedulable {
    public scheduledApex() {

    }
    global void execute(SchedulableContext sc){
        createBatchApex batchApex = new createBatchApex();
        database.executeBatch(batchApex);
    }
}