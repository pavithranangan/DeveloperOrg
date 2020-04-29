@isTest
public class TestApplicant {

  /*  @testSetup
    static void setup(){
        Applicant__c appObject = new Applicant__c(Name='Try4');
        insert appObject;
    }
   @isTest
    static void testInsert(){
        
        Applicant__c appInsertObject = new Applicant__c(Name = 'Try1',Mobile_Number__c = '9485362545');
        Test.startTest();
        insert appInsertObject;
        Test.stopTest();
        
        appInsertObject = [SELECT id,Name FROM Applicant__c WHERE id=:appInsertObject.id];
        System.assertEquals('Try1', appInsertObject.Name);
    }
    
    @isTest
    static void testUpdate(){
        Applicant__c appUpdateObject = [SELECT id,Name,Mobile_Number__c FROM Applicant__c WHERE Name=:'Try4'];
        appUpdateObject.Mobile_Number__c = '9988774455';
        update appUpdateObject;
        System.assertEquals('9988774455', appUpdateObject.Mobile_Number__c);
    }
    */
    @isTest static void testInsert(){
        Test.startTest();
        Applicant.insertApplicant('check2002','9955886644');
        Test.stopTest();
    }

}