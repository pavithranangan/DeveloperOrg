public class caseForm{
    Public blob objFile{get; set;}
    public String caseName{get; set;}
    public String caseSubject{get; set;}
    public String caseDescription{get; set;}
    public String objFileName{get;set;}
    public String alertMessage {get;set;}
     
    Public PageReference saveApplicant(){
        System.debug('Name - '+caseName+' -sub- '+caseSubject+' -Des-'+caseDescription);
        Contact conObj = new Contact(LastName=caseName);
        insert conObj;
      
        Case caseobj = new Case(ContactId=conObj.id,Subject=caseSubject,Description=caseDescription);
        insert caseobj;
      
        
        ContentVersion v = new ContentVersion();
        v.versionData = objFile;
        v.title = objFileName;
        v.pathOnClient ='/somepath.txt';
        v.FirstPublishLocationId=caseObj.id;
        insert v;
        
        if(caseObj.id != null){
            alertMessage = 'Saved successfully';
            String webSite = 'https://www.congruentsoft.com';
            Pagereference pageRef = new Pagereference(webSite);
            pageRef.setRedirect(true);
            return pageRef;   
        }else{
            alertMessage = 'Sorry, Try after sometime';
            return null;
        }
    
    }
}