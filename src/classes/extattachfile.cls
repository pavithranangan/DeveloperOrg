public class extattachfile {
    Public blob objFile{get; set;}
    public String caseName{get; set;}
    public String caseSubject{get; set;}
    public String caseDescription{get; set;}
   //public String objFileName{get;set;}

    
    Public extattachfile(apexpages.standardcontroller stdCon){

    }
    Public void saveApplicant(){
        System.debug('Name - '+caseName+' -sub- '+caseSubject+' -Des-'+caseDescription);
        Contact conObj = new Contact(LastName=caseName);
        insert conObj;
      
        Case caseobj = new Case(ContactId=conObj.id,Subject=caseSubject,Description=caseDescription);
        insert caseobj;
      
        
        ContentVersion v = new ContentVersion();
        v.versionData = objFile;
        v.title = 'type2';
        v.pathOnClient ='/somepath.txt';
        v.FirstPublishLocationId=caseObj.id;
        insert v;
               
    }
}