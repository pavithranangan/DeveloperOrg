public with sharing class checkUpsertTrigger {

    private final List<Applicant__c> applicantVarible;
    private pro__c proVariable,temp;
    private problem__c problemVariable;

    public checkUpsertTrigger() {
      /* ID sampleId = 'a0V2v00000VpBWZEA3' ;
        applicantVarible = [SELECT Id, Name, Address__c,Country__c,Zip_Code__c FROM Applicant__c
        WHERE Id = : sampleId];
         for(Applicant__c appIterate : applicantVarible){
             appIterate.Zip_Code__c ='600025';
             
         }
        applicantVarible.add(new Applicant__c(Name='Viji'));
        
        upsert applicantVarible;
        System.debug(applicantVarible);*/
    }

    
    public void insertProblem(){
        problemVariable = new problem__c(Name='problemVariable1');
        insert problemVariable;
    }
    public void displayProblem(){
        System.debug('problem - '+problemVariable);
    }

    public void insertPro(){
        proVariable = new pro__c(Name='pro1',problem__c=problemVariable.id,phone__c='9955663322');
        insert proVariable;
    }
    public void displayPro(){
        System.debug('pro - '+proVariable);
    }

}