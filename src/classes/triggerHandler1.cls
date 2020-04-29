public with sharing class triggerHandler1 {

    public Applicant__c applicantVariable;

    public triggerHandler1(ApexPages.StandardController controller) {
        applicantVariable = [SELECT Id, Name, Address__c,Country__c,Zip_Code__c FROM Applicant__c
                WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public void tryTrigger(){
        insert applicantVariable;
    }

    public static boolean checkValue(Applicant__c applicantObject){
        Boolean value;
        if(applicantObject.Name == Null) {
         value=true;
         }
        return value;
    }
   
}