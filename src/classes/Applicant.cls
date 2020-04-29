public class Applicant {
    
    private final Applicant__c applicant;
    
    public Applicant () {
        applicant = [SELECT Id, Name FROM Applicant__c WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Applicant__c  getApplicant() {
        return applicant ;
    }
    public PageReference save() {
        update applicant ;
        return null;
    }
   
    public static void insertApplicant(String name ,String mobileNumber){
        Applicant__c applicant = new Applicant__c(Name = name, Mobile_Number__c = mobileNumber);
        insert applicant;
        
        applicant = [SELECT Name FROM Applicant__c WHERE Name =: name];
        System.assertEquals(name, applicant.Name,'Insert Successfully');
        
        Applicant__c applicantUpdate = [SELECT Id, Name FROM Applicant__c WHERE Name =: name];
        applicantUpdate.Mail__c ='vishva@inslight.com';
        update applicantUpdate;
        
        System.assertNotEquals('check2003@inslight.com', applicantUpdate.Mail__c, 'Not updated Successfully');
    }
}