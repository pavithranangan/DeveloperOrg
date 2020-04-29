({
    handleClick: function(component, event, helper) {
        var btnClicked = event.getSource();         // the button
        var btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.message", btnMessage);     // update our message
    },
    handleClick3: function(component, event, helper) {
        var newMessage = event.getSource().get("v.label");
        component.set("v.message", event.getSource().get("v.label"));
        console.log("handleClick3: Message: " + newMessage);
    }

})