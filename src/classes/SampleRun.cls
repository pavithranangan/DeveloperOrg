public with sharing class SampleRun {
    public SampleRun() {
        System.debug('Hello');
    }

    public List<Applicant__c> sampleTest(){
          return [SELECT id, name FROM Applicant__c];
    }
}