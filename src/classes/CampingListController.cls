public with sharing class CampingListController {

@AuraEnabled
    public static List<Camping_Item__c> getItems() {
        List<Camping_Item__c> camping = 
                [SELECT Id, Name,Price__c,Packed__c,Quantity__c FROM Camping_Item__c];

        return camping;
    }
    
@AuraEnabled
    public static void saveItem(Camping_Item__c item){
        //Camping_Item__c newVariable = new Camping_Item__c(item);
        insert item;
       
    }
}