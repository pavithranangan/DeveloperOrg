//Batch class to create Contact and Cases based on Account
global class createBatchApex implements Database.Batchable<sObject> {
    
    //Assigning the values to query to fetch account details
    public createBatchApex() {
    }

    global Database.QueryLocator start(Database.BatchableContext bc){
          String queryVariable ='select id,name from Account order by name ASC Limit 10';
        return Database.getQueryLocator(queryVariable);
    }

    global void execute(Database.BatchableContext bc, List<Account> accList){
       // List<Account> accList = new List<Account>(sVariable);
        List<Account> accountVariable = new List<Account>();
        for(Account acc : accList){
            acc.NumberOfEmployees = 50;
            accountVariable.add(acc);
            Contact conVariable =  new Contact( LastName = 'schedule'+acc.Name,AccountId = acc.Id) ;
            insert conVariable;
        }      
        upsert accList ;
    }

    global void finish(Database.BatchableContext bc){
        System.debug('completed');
    }
}