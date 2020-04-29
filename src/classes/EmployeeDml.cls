public class EmployeeDml {
    
    //creating a account using number of accounts and the name
    public List<ID> createRecordsNumbers(Integer numberOfValues,String name){
        List<Employee__c> listEmployee = new List<Employee__c>{};      
            for(Integer iterative_value = 0;iterative_value<numberOfValues;iterative_value++ ){
                listEmployee.add(new Employee__c(Name=name+iterative_value,Are_you_working_on_another_company__c='Yes',Mobile_Number__c='9558641259'));
            }
        insert listEmployee;
        List<ID> id_values = new List<ID>{};
            for(Employee__c iterative_ids : listEmployee){
                // System.debug(iterative_ids.Id);
                id_values.add(iterative_ids.Id);
            }
        return id_values;
    }
    
    //updation of existing records using condition with values to be updated
    public List<ID> updateRecordsList(String valueBeUpdate, String valueToUpdate){
        List<Employee__c> employeeVariable = new List<Employee__c>{};      
            List<ID> updatedID = new List<ID>{};
                for(Employee__c variableIterate : [SELECT ID, name, Designation__c FROM Employee__c Where Designation__c=: valueBeUpdate]){           
                    variableIterate.Designation__c = valueToUpdate;     
                    employeeVariable.add(variableIterate);
                    update variableIterate;
                }       
        for(Employee__c idVariable : employeeVariable){
            updatedID.add(idVariable.Id);
        }
        return updatedID;
    }
    
    //deletion of existing records using account id
    public void deleteRecordsCondition(String selectionValue){  
                for(Employee__c deleteIterate : [SELECT id FROM Employee__c WHERE Are_you_working_on_another_company__c=:selectionValue]){
                    delete deleteIterate;  
                }    
 				 
    }

}