({
    
    doInit : function(component, event, helper) {
        var timing;
        var recordId = component.get( "v.recordId" );
        var action = component.get("c.getLead");
        action.setParams({ recordID : recordId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.resultantValue",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    checkAccount : function(component, event, helper){
        helper.checkOpportunity(component,event,helper);
    },
    
    checkApi : function(component, event, helper){
        var result;
        var action = component.get("c.getPeople");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                result = response.getReturnValue();
                component.set("v.checkPeople",result);
            }
        });
        $A.enqueueAction(action);   
    },
    
    checkVf : function(component, event, helper){
        var recordId = component.get( "v.recordId");
        //var url = "/apex/loadLeadRecords";
        var url = '/apex/opportunityTabularPage';
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": url
        });
        urlEvent.fire();
        
    },
    
    relatedListAccount : function(component, event,helper){
        var recordId = component.get( "v.recordId");
        var action = component.get("c.getRelatedList");
        action.setParams({ recordID : recordId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.noOfContact","No. of Contact - "+response.getReturnValue()['Contact']);
                component.set("v.noOfOpportunity","No. of Opportunity - " +response.getReturnValue()['Opportunity']);
            }
        });
        $A.enqueueAction(action);
    },
    
    NavigationRec : function(component, event, helper) {
		
        component.find("navId").navigate({
            type: 'standard__recordPage',
            attributes: {
                recordId : '0032v00002rgku6AAA', // Hardcoded record id from given objectApiName
                actionName: 'view',  //Valid values include clone, edit, and view.
                objectApiName: 'Contacts', //The API name of the record’s object
            }}, true);
    }
    
})