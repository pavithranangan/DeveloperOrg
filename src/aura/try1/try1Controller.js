({
    clickCreateItem : function(component, event, helper) {
        
        // var newCampingItem = component.get("v.campingItemForm");
        //helper.createItem(component,newCampingItem);
        var campingItems = JSON.stringify(component.get("v.campingItemForm"));
        helper.createItem(component,campingItems);
        //try1Controller.saveItem(campingItems);
    } ,
    
    doInit : function(component, event, helper) {
        var action = component.get("c.campTry");
        // action.setParams({fields : JSON.stringify(fields)});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set('v.campaingValue',response.getReturnValue()); 
            }else if(state === "ERROR"){
                var error = response.getError(error);
                component.find("notify").showError(error);
            }
        });
        $A.enqueueAction(action);
    },
    
    doCancel : function(component, event, helper) {
        var ok = component.get('v.campaingValue.Name');
        var ok2 = component.get('v.campaingValue.Packed__c');
        var ok3 = component.get('v.campaingValue.Price__c');
        const myCheckboxes = component.find('myCheckboxes'); 
        alert('Name - '+ok+'Packed__c -'+ok2+'Price__c -'+ok3+ 'myCheckboxes'+myCheckboxes[0].get("v.checked"));
        for (var i = 0; i < myCheckboxes.length; i++) {
           alert(myCheckboxes[i].get("v.checked"));
           alert(myCheckboxes[i].get("v.value"));
        }
        
    },
    
    handleSuccess : function(component, event, helper){
        alert('shown');
    },
    
    checkValidity : function(component, event, helper) {
        var validity = event.getSource().get("v.validity");
        console.log(validity)
    },
    onClick: function (cmp, evt, helper) {
        var allValid = cmp.find('field').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if (allValid) {
            alert('All form entries look valid. Ready to submit!');
        } else {
            alert('Please update the invalid form entries and try again.');
        }
    },
    
    changeVal : function (cmp, evt, helper) {
        var val = cmp.get('v.name');
        alert('val'+val);
    },
    
    changeValDate : function (cmp, evt, helper) {
        alert('hi');
        var val1 = cmp.find("expDate").get("v.value");
        alert('val1'+val1);
        cmp.set('v.dateDefaultWithTimeString',val1);
    }
});