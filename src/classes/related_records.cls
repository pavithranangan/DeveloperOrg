public class related_records {
    List<Contact> contacts ;
    
    public List<Contact> creation(List<Contact> contact){
        contacts = new List<Contact>{};
            
        for(Integer i=0;i<contact.size();i++){
            insert contact[i];
        }
        return contact;
    }
    
    public List<Contact> display(String account_id){
        Contact[] contact_details = [Select id,name,phone from Contact where AccountId=:account_id];
        return contact_details;
    }
    
    
}