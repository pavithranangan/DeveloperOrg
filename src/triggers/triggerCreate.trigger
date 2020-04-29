trigger triggerCreate on Applicant__c (before insert,after update) {

    if(Trigger.isBefore){
       if(Trigger.isInsert){
            for(Applicant__c applicantObject : Trigger.new){
                if(applicantObject.Name == null){
                    applicantObject.addError('Enter the Applicant name');
                }
            }
        }
    }
}