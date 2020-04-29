({
	createItem : function(component,newCampingItem) {
        var action = component.get("c.saveItem");
        action.setParams({
            "campingItem" : newCampingItem
        });
        
    }
})