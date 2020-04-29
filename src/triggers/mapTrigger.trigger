trigger mapTrigger on Map__c (before insert) {
    List<Link__c> linkVar = new List<Link__c>();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            for(Map__c mapVar : Trigger.new){
                linkVar.add(new Link__c(Name='gq'));
            }
            insert linkVar;
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            for(Map__c val : Trigger.New){
            for(Link__c lVar : [SELECT id FROM Link__c WHERE Name=:val.name]){
                val.Link__c = lVar.id;
                update val;
            }
            }
        }
    }
}