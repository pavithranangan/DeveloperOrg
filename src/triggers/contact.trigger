trigger contact on Contact (after delete) {
    if(Trigger.isAfter){
        if(Trigger.isDelete){
            
            /*for(contact ko : [select id,AccountId from contact where Id IN: Trigger.Old]){
                for(Account opp :[select id,SLA__c from account where id=: ko.AccountId]){
                    opp.SLA__c ='hi';
                    update opp;
                }
            }*/
            
            for(contact k : Trigger.old){
                Account ac = [select id,SLA__c from Account where id =: k.AccountId];
                ac.SLA__c = 'ji';
                update ac;
            }
        }
    }
}