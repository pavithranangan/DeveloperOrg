public with sharing class sampleController {
    public Account getAccount() {
        return account;
    }

 
   //public List<Account> acctList {get;set;}    
    Account account {get;set;}   
    public List<Contact> contList {get; set;}
     
      public sampleController() {
               account= new Account();
                contList = new List<Contact>();
               AddRow();                        
      
   }
   
    public PageReference AddRow() {
    contList.add(new Contact());
    return null;
  } 

 public PageReference Save() {
       upsert account;
       
       List<Contact> conts = new List<Contact>();
       if(account != null) {
        for(Contact c : contlist) {
         c.AccountId = account.Id;
         conts.add(c);
        }
       }
       if(conts != null) { 
       insert contList;
       }
       return null;
  } 
}