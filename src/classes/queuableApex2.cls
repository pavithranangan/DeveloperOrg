public with sharing class queuableApex2 implements Queueable {
    Id idSetOpp;
    public queuableApex2(ID allInsertedIdsOpp) {
        idSetOpp = allInsertedIdsOpp;
    }

    public void execute(QueueableContext qc){
        List<Opportunity> oppVaribale = new List<Opportunity>();
        oppVaribale.add(new Opportunity( Name = 'QueueOpp5',CloseDate = date.parse('02/06/2019'),StageName = 'Prospecting',AccountId = idSetOpp));
        oppVaribale.add(new Opportunity( Name = 'QueueOpp6',CloseDate = date.parse('04/07/2019'),StageName = 'Value Proposition',AccountId = idSetOpp));
        /*for(Opportunity oppVar : oppVaribale){
            for( Id idVar : idSetOpp){
                oppVar.AccountId = idVar;
            }
        }*/
        insert oppVaribale;
    }
}