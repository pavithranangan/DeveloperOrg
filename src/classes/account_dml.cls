public class account_dml {
    
    //creating a accounts
    public ID creation(String name, String phone, String website,Integer location){
        Account create_account= new Account(Name=name,Phone=phone,Website=website,NumberofLocations__c=location);
        insert create_account;
        return create_account.Id;
    }
    
    //creating account using list
    public static List<Account> create_records(List<Account> list_insert){
        List<Account> insert_values = new List<Account>(list_insert);
        insert insert_values;
        return insert_values;
    }
    
    
    //creating a account using number of accounts and the name
    public List<ID> create_records_numbers(Integer numberOfValues,String name){
        List<Account> list_account = new List<Account>{};      
            for(Integer iterative_value = 0;iterative_value<numberOfValues;iterative_value++ ){
                list_account.add(new Account(Name=name+iterative_value,Rating='Hot'));
            }
        insert list_account;
        List<ID> id_values = new List<ID>{};
            for(Account iterative_ids : list_account){
                // System.debug(iterative_ids.Id);
                id_values.add(iterative_ids.Id);
            }
        return id_values;
    }
    
    
    //display name using list of account ids
    public List<Account> display_using_id(List<String> list_id){
        Account[]  display_id;
        for(String account_id : list_id){
            display_id= [Select name from Account where Id = :account_id];
        }
        return display_id;
    }
    
    //displaying account name which created on current date
    public List<Account> display_using_date(){
        Account[] display_date= [Select name from Account where createddate >:date.today()];
        return display_date;
    }
    
    //updation of existing records using account id
    public List<Account> update_records(List<Account> account_list){
        for(Account account_variable : account_list){           
            account_variable.BillingCity = 'San Francisco';
            account_variable.NumberofLocations__c = 6;     
        }       
        update account_list;
        return account_list;
    }
    
    //updation of existing records using condition with values to be updated
    public List<ID> updateRecordsList(Integer valueBeUpdate, Integer valueToUpdate){
        List<Account> accountVariable = new List<Account>{};      
            List<ID> updatedID = new List<ID>{};
                for(Account variableIterate : [SELECT ID, name, NumberofLocations__c FROM Account Where NumberofLocations__c=: valueBeUpdate]){           
                    variableIterate.NumberofLocations__c = valueToUpdate;     
                    accountVariable.add(variableIterate);
                    update variableIterate;
                }       
        for(Account idVariable : accountVariable){
            updatedID.add(idVariable.Id);
        }
        return updatedID;
    }
    
    //deletion of existing records based on condition
    public List<Account> delete_records(List<Account> account_list){ 
        delete account_list;       
        return account_list;
    }
    
    //deletion of existing records using account id
    public List<Account> deleteRecordsCondition(String stageName){
        List<Account> deleteVariable = new List<Account>{};      
            List<ID> deletedID = new List<ID>{};
                for(Account deleteIterate : [SELECT id FROM Account WHERE Rating=:stageName]){
                    delete deleteIterate;  
                    deleteVariable.add(deleteIterate);
                }
        for(Account idDeleteVariable : deleteVariable){
            deletedID.add(idDeleteVariable.Id);
        }
        return deleteVariable;
    }
}