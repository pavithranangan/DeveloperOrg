({
    checkOpportunity : function(component, event) {
        var recordId = component.get( "v.recordId" );
        var action = component.get("c.getOpportunity");
        action.setParams({ recordID : recordId});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set('{!v.resultCustomer}',response.getReturnValue());
                // helper.checkOpportunity(component,response.getReturnValue()['Company']);
            }
        });
        $A.enqueueAction(action);   
        
    }
})