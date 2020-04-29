public with sharing class EmployeeGetterSetter {

    private Applicant__c acct;
    String m;

    public EmployeeGetterSetter( ) {
    }

    public void setSearchText(String  applicantName){
        m=applicantName;
    }

    public String getSearchText(){
        return m;
    }

    public void addition(){
        m = 'Success - '+m;
    }

    
}