trigger leadTrigger on Lead (Before update) {
    if(trigger.isUpdate){
        if(trigger.isUpdate){
            for(Lead leadObj : trigger.new){
                if(leadObj.IsConverted){
                    for(Case caseObj : [SELECT id FROM Case WHERE Lead__c =: leadObj.Id]){
                        caseObj.AccountId = leadObj.ConvertedAccountId;
                        caseObj.ContactId = leadObj.ConvertedContactId;
                        caseObj.Opportunity__c =  leadObj.ConvertedOpportunityId;
                        caseObj.Lead__c = null;
                        update caseObj;                    
                    }
                }
            }
        }
    }
}