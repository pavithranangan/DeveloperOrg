public class documentExt {

Public Attachment objAttachment{get; set;}
Public Case objCase {get; set;}

Public documentExt(){
	objCase = new Case();
}
    
Public void saveCase(){
System.debug(objCase);
try{
            insert objCase;
        }catch(DmlException e){
            System.debug('Kindly enter proper values' + e.getMessage());
        } 
  System.debug('case'+ objCase);
 // objAttachment.ParentId = objCase.id;
//System.debug('attach'+objAttachment);
//insert objAttachment;
}                
}