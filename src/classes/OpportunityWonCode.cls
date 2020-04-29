public class OpportunityWonCode {
    public void updateAccount(String id){
        //for(Opportunity stringVariable : [SELECT AccountId FROM Opportunity WHERE ID =: id]){           
        //  stringVariable.LeadSource = 'Purchased List';  
        //update stringVariable;
        // }
        List<Opportunity> opportunity = new List<Opportunity>([SELECT AccountId,Name,Amount FROM Opportunity WHERE ID =: id]);
        List<Account> account = new List<Account> ([SELECT OpportunityAmount__c FROM Account WHERE ID =: opportunity[0].AccountId]);
        System.debug('account amount'+account[0].OpportunityAmount__c );
        System.debug('opportunity amount'+ opportunity[0].Amount); 
        System.debug(account[0].OpportunityAmount__c +=opportunity[0].Amount);        
    } 
}