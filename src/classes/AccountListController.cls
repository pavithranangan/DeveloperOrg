public class AccountListController {
    @AuraEnabled    
    public static List < Account > fetchAccts() {    
        
        return [ SELECT Id, Name, Industry, Type, CreatedDate FROM Account LIMIT 10 ];    
        
    }    
    
    @AuraEnabled    
    public static boolean updateAccts( List < Account > updatedAccountList ) {    
        
        try {  
            
            update updatedAccountList;  
            return true;  
            
        } catch(Exception e) {  
            
            return false;  
            
        }  
        
    }
    
    @AuraEnabled
    public static List<Opportunity> fetchOpp(){
        return [ SELECT Id, Name,AccountId, Amount,StageName FROM Opportunity LIMIT 10 ];
    }
    
    @AuraEnabled
    public static String updateOpp(String draftValues, String mydata){
        
        List<Opportunity> draftValues1 = (List<Opportunity>)JSON.deserialize(draftValues, List<Opportunity>.class);
     //   List<Opportunity> mydata1 = (List<Opportunity>)JSON.deserialize(mydata, List<Opportunity>.class);
        String val ;
        try{
            if(draftValues1.size()>0){
                    update draftValues1;
                    val = 'true';
            }
        }catch(Exception e){
            
            val = 'ss'+e;
        }
        
        //return draftValues1+'mydata1'+mydata1;
        //  return draftValues1.size();
        return val;
    }    
}