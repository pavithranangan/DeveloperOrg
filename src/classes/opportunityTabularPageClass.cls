public class opportunityTabularPageClass {
    public List <Opportunity> oppVariable {get;set;}
    public opportunityTabularPageClass(){
        oppVariable = [select Name, Amount, CloseDate, StageName, AccountId from Opportunity where StageName != 'Closed Won' LIMIT 300];
    }
    public PageReference quickUpdat(){
        try{
            update oppVariable ;
            //System.debug(oppVariable);
            return ApexPages.CurrentPage();
        }catch(Exception e){
            //System.debug('@@@Error');
            return null;
        }
    }
    
}