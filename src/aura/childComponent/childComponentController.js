({
    doAction : function(cmp, event) {
        var params = event.getParam('arguments');
        // if (params) {
        var param1 = params.param1;
        console.log('param1'+param1);
        cmp.set('v.myString','Hello World');
        var vx = cmp.get("v.method");
        //fire event from child and capture in parent
        $A.enqueueAction(vx);
        // }
    },
    
    press : function(cmp, event, helper) {
        //set the child component value.
        // cmp.set('v.myString','Hello World');
        //var vx = cmp.get("v.method");
        //fire event from child and capture in parent
        //$A.enqueueAction(vx);
        
        cmp.set("v.childAttr", "updated child attribute");
    },
    
    onCheck : function(cmp, event, helper){
        var checkvalue = cmp.find("checkCategory");
        var selectedCategories = [];
        if(!Array.isArray(checkvalue)){
            if (checkvalue.get("v.value") == true) {
                selectedCategories.push(checkvalue.get("v.text"));
                alert(checkvalue.get("v.text"));
            }
        }else{
            for (var i = 0; i < checkvalue.length; i++) {
                if (checkvalue[i].get("v.value") == true) {
                    selectedCategories.push(checkvalue[i].get("v.text"));
                    alert(checkvalue.get("v.text"));
                }
            }
        }
        alert(selectedCategories);
        if(selectedCategories.length >0){
            cmp.set('v.childAttr',selectedCategories);
        }
    },
    
    update : function (cmp, event) {
        $A.util.toggleClass(event.getSource(), "red");
    },
    
    doInit : function(cmp,event){
        var p = cmp.get("v.parent").parentMethod('gyy','fsa');
          //  p.parentMethod();
    },
    
    changeValue : function (component, event, helper) {
      component.set("v.myBool", false);
        alert('change child');
    },
    initiation : function (component, event, helper){
        var action = component.get("c.fetchOpp");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //   alert('value returned');
                component.set('v.mydata', response.getReturnValue());
            }
            else if (state === "ERROR") {
                // handle error
            }
        });
        $A.enqueueAction(action);
        
    }
    
    
})