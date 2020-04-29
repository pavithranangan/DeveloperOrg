public class OpportunityWon {
	//@InvocableMethod
    public void updateAccount(String id){
        //for(Opportunity stringVariable : [SELECT AccountId FROM Opportunity WHERE ID =: id]){           
          //  stringVariable.LeadSource = 'Purchased List';  
            //update stringVariable;
            // }
        List<Opportunity> opportunity = new List<Opportunity>([SELECT AccountId FROM Opportunity WHERE ID =: id]);
        System.debug(opportunity);
            } 
}