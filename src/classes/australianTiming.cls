public with sharing class australianTiming {
            
    @AuraEnabled
    public static Map<String, String> getLead(String recordID){
        
        // to get the australian timing
        Map<String,String> resultantString = new Map<String,String>();
        Lead leadVariable = [SELECT Id, Name, Company,City, State FROM LEAD WHERE ID =: recordID LIMIT 1];
        DateTime currenttime = DateTime.now();
        String strConvertedDate = currenttime.format('MM/dd/yyyy HH:mm:ss', 'Australia/'+leadVariable.State);
        resultantString.put('australianTime',strConvertedDate);
        
        // to get the weather status 
        Http http = new Http(); String val;
        HttpRequest request = new HttpRequest();
        //http://api.openweathermap.org/data/2.5/weather?q=Chennai&appid=3893708be2490c1fde769f44ac2072a1&units=metric
        //request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q='+leadVariable.City+'&appid=3893708be2490c1fde769f44ac2072a1&units=metric');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> resulting = (Map<String, Object>) results.get('main');
            Decimal mainValues = (Decimal) resulting.get('temp');
            resultantString.put('Weather',String.valueOf(mainValues));
        }        
        System.debug(resultantString);
        return resultantString; 
    }
    
    @AuraEnabled
    public static String getOpportunity(String recordID){
        Integer countWon, countLost;
        String value;
        System.debug('id'+ recordID);
        List<Lead> leadVariable = [SELECT Id, Name, Company, State FROM LEAD WHERE ID =: recordID];
        System.debug('lead'+leadVariable);
        if(leadVariable.size()>0){
            List<Account> accountVariable = [SELECT Id, Name FROM Account WHERE Name =: leadVariable[0].Company];
            System.debug('Account'+accountVariable);
            if(accountVariable.size()>0){
                List<Opportunity> oppVariable = [SELECT Id,	Name, AccountId, StageName from Opportunity WHERE StageName =: 'Closed Won' AND AccountId =: accountVariable[0].Id];
                System.debug('opp'+oppVariable.size());
                if(oppVariable.size() >0){
                    value = 'Existing Customer';
                }else{
                    value = 'Prospect';
                }
            }else { value = 'Prospect'; }
        }else { value = 'Prospect'; }
        return value;
    }
    
    @AuraEnabled
    public static Integer getPeople(){
        List<String> peopleList = new List<String>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.open-notify.org/astros.json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> peoples = (List<Object>) results.get('people');
            System.debug('Received the following animals:');
            for(Object objectVariable: peoples){
                peopleList.add(String.valueOf(objectVariable));
            }
            
            for (String str : peopleList) {
                System.debug(str);
            }
        }
        return peopleList.size();
    }
    
    @AuraEnabled 
    public static Map<String,Integer> getRelatedList(String recordID){
        
        Map<String,Integer> relatedList = new Map<String,Integer>();
        List<Contact> contactCount = [SELECT Id FROM CONTACT WHERE AccountId =: recordId];
        relatedList.put('Contact', contactCount.size());
        
        List<Opportunity> opportunityCount = [SELECT Id FROM OPPORTUNITY WHERE AccountId =: recordId];
        relatedList.put('Opportunity', opportunityCount.size());
        System.debug(relatedList);
        
        return relatedList;
    }
}