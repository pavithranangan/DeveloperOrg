public class tryVfClass {
    
    public list<Opportunity> currentRecordId{set;get;}
    
    public tryVfClass(ApexPages.StandardController controller) {
      currentRecordId = [SELECT Id FROM Opportunity WHERE Id = :ApexPages.currentPage().getParameters().get('id') LIMIT 1];
    }
}