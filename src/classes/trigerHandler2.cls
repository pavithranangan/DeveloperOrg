public with sharing class trigerHandler2 {
    public trigerHandler2() {

    }
     public static boolean checkValue(Applicant__c applicantObject){
        Boolean value;
        if(applicantObject.Name == Null) {
         value=true;
         }
        return value;
    }
}