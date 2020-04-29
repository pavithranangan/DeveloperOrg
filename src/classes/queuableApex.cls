public class queuableApex implements Queueable{
    Id idSet;
    public queuableApex(Id allInsertedIds) {
        idSet = allInsertedIds;
    }
    public void execute(QueueableContext qc){
        List<Contact> conVaribale = new List<Contact>();
        conVaribale.add(new Contact( LastName = 'QueueCon7',Phone = '9495523366',Email = 'div23.23@gmail.com',AccountId = idSet));
        conVaribale.add(new Contact( LastName = 'QueueCon8',Phone = '9955223466',Email = 'hem.27@gmail.com',AccountId = idSet));
        conVaribale.add(new Contact( LastName = 'QueueCon9',Phone = '9955224366',Email = 'ved.6@gmail.com',AccountId = idSet)) ;
        /*for(Contact conVar : conVaribale){
            //for( Id idVar : idSet){
                conVar.AccountId = idVar;
            //}
        }*/
        insert conVaribale;
        System.debug('opportunity - '+System.enqueueJob(new queuableApex2(idSet)));

    }
}