trigger triggerPro on problem__c (before insert) {

    set<id> setID = new set<id>();

    if(Trigger.isBefore){
       if(Trigger.isInsert){
            for(problem__c problemVariable : Trigger.new){
                setID.add(problemVariable.id);
                System.debug('set'+setID);
            }
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){        
            /*for(problem__c problemVariable2 : Trigger.new){   
                problem__c problemVariableNew = trigger.newMap.get(problemVariable2.id);
                System.debug('new set'+problemVariableNew);
            }*/
            System.debug('completed');
    }}
}