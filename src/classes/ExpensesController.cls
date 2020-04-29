public class ExpensesController {
@AuraEnabled
    public static List<Expense__c> getExpenses(){
        return [SELECT Id, Name FROM Expense__c];
    }
}