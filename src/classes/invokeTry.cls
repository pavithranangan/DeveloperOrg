global class invokeTry{
   // @InvocableMethod
    global static List<List<Recommendation>> invokeMethod(List<String> inputData){
        List<List<Recommendation>> outputs = new List<List<Recommendation>>();
        System.debug('invoke method called'+inputData);
        List<Recommendation> recs = new List<Recommendation>(); 
        Recommendation rec = new Recommendation(
            Name = 'Try Apex',
            Description = 'hi apex works create a opportunity',
            //Pre-req: Create a screen flow with the name simpleFlow                        
            ActionReference = 'New_Oppty',
            AcceptanceLabel = 'New_Oppty'
        );
        recs.add(rec);
        outputs.add(recs);
        return outputs;         
    }
    
    @InvocableMethod
    global static void chkMethod(List<String> inputData){
        System.debug('inputData'+inputData[0]);
    }
}