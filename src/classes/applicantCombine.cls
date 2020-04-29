public with sharing class applicantCombine {
    private final Applicant__c applicantVarible;

public applicantCombine(ApexPages.StandardController acon) {
    applicantVarible = [SELECT Id, Name, Address__c,Country__c,Zip_Code__c FROM Applicant__c
                WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
}

public Map<String,String> getCombine(){
    Map<String,String> addressCombine = new Map<String, String>{'Address' => applicantVarible.Address__C, 
            'Country' => applicantVarible.Country__c};
    return addressCombine;
}

public String getCombineAddress(){
   return  applicantVarible.Address__C+','+applicantVarible.Country__c+','+applicantVarible.Zip_Code__c;
}

public Pagereference deleteApplicant(){
    delete applicantVarible;
    //Pagereference pageRef = new PageReference('Applicant__c/list?filterName=Recent');
   // pageRef.setRedirect(true);
    return new ApexPages.Action('{!List}').invoke();
   // return pageRef;
}
}