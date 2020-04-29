trigger asynTrigger on Account (before insert,after insert) {
    if(Trigger.isBefore){

    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            Set<Id> variable = Trigger.newMap.keySet();
            for(Id idVar : variable){
                System.debug('Contact'+System.enqueueJob(new queuableApex(idVar)));
            }
           // asynClassTrigger.createContact(variable);
            /* for(Account accountVariable : trigger.new ){
                Account accountId = Trigger.newMap.get(accountVariable.Id);
                asynClassTrigger.createContact(accountId.Id);
            }*/
        }
    }
}