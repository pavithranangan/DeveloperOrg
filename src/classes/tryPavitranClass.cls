public class tryPavitranClass
{
    public transient List<Account> accounts {get; set;}
    public transient Id count{get;set;}
    public transient List<Id> idAcc {get;set;}
    public Integer size {get; set;}
    public ID opportunityToDisplay {set;get;}
    
    public tryPavitranClass()
    {
        size=1;
        setupAccounts();
    }
    
    private void setupAccounts()
    {
        accounts=[select id, Name from Account limit :size];
        idAcc = new List<Id>();
        for(Account acc : accounts){
            idAcc.add(acc.Id);
        }
		 count = idAcc.get(size-1);
    }
    
    public void next()
    {
        size+=1;
        setupAccounts();
    }
}