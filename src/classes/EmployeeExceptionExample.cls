public class EmployeeExceptionExample {
    public List<ID> sampleException(List<Employee__c> listEmployee){
        Database.SaveResult[] srList;
        List<ID> updatedID = new List<ID>{};
            for(Employee__c iterateVariable : listEmployee){
                if(iterateVariable.Name =='employeeName1'){ 
                    iterateVariable.Mobile_Number__c='';
                }else{
                    iterateVariable.Address__c='Mumbai';   
                }
            }
        try{
            srList = Database.update(listEmployee, true);  
            for(Database.SaveResult idVariable : srList){
                updatedID.add(idVariable.Id);
            }
        }catch(DmlException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return updatedID;
    }
}