({
    handleConfirmDialog : function(component, event, helper) {
        var selectedEventId = event.target.id;
        var msg ='Are you sure you want to delete this item?';
        if (!confirm(msg)) {
            console.log('No');
            return false;
        } else {
            console.log('Yes');
            //Write your confirmed logic
        }
    }
    })