global class ChoseRecommendation {
    
    global static List<List<Recommendation>> invokeMethod(List<String> inputData){
        List<List<Recommendation>> upperList = new List<List<Recommendation>>();
        List<Recommendation> innerList = new List<Recommendation>();
        Account[] accounts = [SELECT Name, Description,CreatedDate, id,Type FROM Account WHERE id = :inputData[0]];
        String type =  accounts[0].Type; 
        
        if(type == 'Prospect' && type != null){
            //Recommendation recomProspect = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name = :'Prospect'];
            List<Recommendation> recomPro = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name IN('Service Cloud','Sales Cloud')];
            if(recomPro != null){
                for(Recommendation com : recomPro ){
                    Recommendation rec = new Recommendation(
                        Name = com.Name,
                        Description = com.Description,                     
                        ActionReference = com.ActionReference,
                        AcceptanceLabel = com.AcceptanceLabel
                    );
                    innerList.add(rec);
                }
            }
        }else if(type == 'Customer - Direct' && type != null){
            List<Recommendation> recom = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name IN('Service Cloud','Analytics Cloud')];
            if(recom != null){
                for(Recommendation com : recom){
                    Recommendation rec = new Recommendation(
                        Name = com.Name,
                        Description = com.Description,                     
                        ActionReference = com.ActionReference,
                        AcceptanceLabel = com.AcceptanceLabel
                    );
                    innerList.add(rec);
                }
            }
        }else if(type == 'Customer - Channel' && type != null){
            Recommendation recomEinstein = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name = :'Einstein'];
            innerList.add(recomEinstein);
        }
        upperList.add(innerList);
        System.debug('upperList'+upperList);
        return upperList;
        
    }
    
    @InvocableMethod
    global static List<List<Recommendation>> checkChildInvoke(List<String> inputData){
        List<List<Recommendation>> upperList = new List<List<Recommendation>>();
        List<Recommendation> innerList = new List<Recommendation>();
   
        Account[] accounts = [SELECT Id, Name,Type, (SELECT AccountId, Id, Languages__c  FROM Contacts where AccountId =: inputData[0] AND Languages__c =: 'tamil') FROM Account WHERE Id =: inputData[0]];
       // System.debug('accounts.contacts'+accounts[0].contacts);
        Contact[] contacts = accounts[0].contacts;
        System.debug('size'+contacts.size());
        String type =  accounts[0].Type; 
        
        if(type == 'Prospect' && type != null && contacts.size()>0){
            //Recommendation recomProspect = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name = :'Prospect'];
            List<Recommendation> recomPro = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name IN('Service Cloud','Sales Cloud')];
            if(recomPro != null){
                for(Recommendation com : recomPro ){
                    Recommendation rec = new Recommendation(
                        Name = com.Name,
                        Description = com.Description,                     
                        ActionReference = com.ActionReference,
                        AcceptanceLabel = com.AcceptanceLabel
                    );
                    innerList.add(rec);
                }
            }
        }else if(type == 'Customer - Direct' && type != null && contacts.size()>0){
            List<Recommendation> recom = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name IN('Service Cloud','Analytics Cloud')];
            if(recom != null){
                for(Recommendation com : recom){
                    Recommendation rec = new Recommendation(
                        Name = com.Name,
                        Description = com.Description,                     
                        ActionReference = com.ActionReference,
                        AcceptanceLabel = com.AcceptanceLabel
                    );
                    innerList.add(rec);
                }
            }
        }else if(type == 'Customer - Channel' && type != null && contacts.size()>0){
            Recommendation recomEinstein = [SELECT Name, Description,ActionReference, id,AcceptanceLabel FROM Recommendation WHERE Name = :'Einstein'];
            innerList.add(recomEinstein);
        }
        upperList.add(innerList);
        System.debug('upperList'+upperList);
        return upperList;
        
    }
}