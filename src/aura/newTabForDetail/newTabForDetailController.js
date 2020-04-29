({
    var : function(component,event,helper){
    	var recordId = component.get("v.recordId");
    	//alert(component.get("v.simpleRecord").AccountId);
    	var accountId = component.get("v.simpleRecord").AccountId;
    	component.set("v.editActive", true);
    	component.set("v.accountId",accountId);
	},
 
 	save : function(component, event, helper) {
    	component.set("v.isActive", true);
    	component.find("edit").get("e.recordSave").fire();
	}
})