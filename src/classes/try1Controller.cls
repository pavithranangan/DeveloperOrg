public class try1Controller {

    @AuraEnabled
    public static void saveItem (Camping_Item__c campingItem) {
   
        insert campingItem;
    }
    
    @AuraEnabled
    public static Camping_Item__c campTry (String fields) {
        Camping_Item__c camp = new Camping_Item__c();
        return camp;
    }
 }