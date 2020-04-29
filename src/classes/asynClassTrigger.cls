public with sharing class asynClassTrigger {
    public asynClassTrigger() {

    }

    @future
    public static void createContact(Set<Id> allInsertedIds){
        List<Contact> conVaribale = new List<Contact>();
        conVaribale.add( new Contact( LastName = 'QueueDivya1',Phone = '9495523366',Email = 'div23.23@gmail.com'));
        conVaribale.add(new Contact( LastName = 'QueueHema1',Phone = '9955223466',Email = 'hem.27@gmail.com'));
        conVaribale.add(new Contact( LastName = 'QueueVedha1',Phone = '9955224366',Email = 'ved.6@gmail.com')) ;
        for(Contact conVar : conVaribale){
            for( Id idVar : allInsertedIds){
                conVar.AccountId = idVar;
            }
        }
        insert conVaribale;
    }

/*
    public static void display(Set<Id> allInsertedIds){
        Contact conVaribale;
        for( Id var : allInsertedIds){
             conVaribale = new Contact(LastName = 'Madhu1');
             conVaribale.AccountId=var;
             System.debug(var);
        }
        insert conVaribale;
    }*/
}