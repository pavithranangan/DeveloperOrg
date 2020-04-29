//controller class for combination of Account and Contact
public with sharing class combinationAccountContact {
    public Account getAccount() {
        return accountVf;
    }

    public Account accountVf {get;set;}   
    public List<Contact> contactVf {get; set;}

    //constructor for declaration    
    public combinationAccountContact() {
        accountVf= new Account();
        contactVf = new List<Contact>();
        AddRow();                        
    }

    //to add new contact   
    public PageReference AddRow() {
        contactVf.add(new Contact());
        return null;
    } 

    //Save account and contact
    public PageReference SaveAll() {
        try{
            insert accountVf;
        }catch(DmlException e){
            System.debug('Kindly enter proper values' + e.getMessage());
        }   
        List<Contact> conts = new List<Contact>();
        if(accountVf != null) {
            for(Contact c : contactVf) {
                c.AccountId = accountVf.Id;
                conts.add(c);
            }
        }
        if(conts != null) { 
            try{
                insert contactVf;
            }catch(DmlException e){
                System.debug('Kindly enter the proper values' + e.getMessage());
            }
        }

        Pagereference pageRef = new Pagereference('/'+accountVf.Id);
        pageRef.setRedirect(true);
        return pageRef;
    } 

}