trigger taskTrigger on Task (before insert,after insert,after update) {
    if (Trigger.isBefore) {}
    else if(Trigger.isAfter){
        Task taskVar = [SELECT Id,subject,TaskSubtype,WhatId,What.type FROM Task WHERE Id =: Trigger.New];
        System.debug('task'+taskVar.What.Type);
        List<Task> taskTotal = [SELECT Id FROM Task WHERE WhatId =: taskVar.WhatId];
        
        if(taskVar.what.Type == 'Opportunity'){
            Opportunity oppVar = [SELECT Id,Number_of_calls__c FROM Opportunity WHERE Id =: taskVar.WhatId ];
            oppVar.Number_of_calls__c = taskTotal.size();
            update oppVar;
        }else if(taskVar.what.Type == 'Lead'){
            Lead leadVar = [SELECT Id,Number_of_calls__c FROM Lead WHERE Id =: taskVar.WhatId ];
            leadVar.Number_of_calls__c = taskTotal.size();
            update leadVar;
        }
    }
}