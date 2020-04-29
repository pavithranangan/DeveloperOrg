({
    doAddRfi : function(component, event, helper){
        alert('hi parent');
        var params = event.getParam('arguments');
        if (params) {
            var param1 = params.param1;
            // add your code here
        }
    },
    
    handleValueChange : function (component, event, helper) {
        alert("old value: " + event.getParam("oldValue"));
        alert("current value: " + event.getParam("value"));
    },
    alertV : function (component, event, helper) {
        alert('works when change');
    },
    
    //new component
    onInit : function( component, event, helper ) {    
        
        component.set( 'v.mycolumns', [    
            {label: 'Account Name', fieldName: 'Name', type: 'text', editable:'true'},    
            {label: 'AccountId', fieldName: 'Industry', type: 'text'}
        ]);    
        helper.fetchAccounts(component);  
        
    },
    
    init: function (cmp, event, helper) {
        cmp.set('v.mycolumns', [
            { label: 'Opportunity name', fieldName: 'Name', type: 'text'},
            {
                label: 'AccountId',
                fieldName: 'AccountId',
                editable:'true'
            },
            {
                label: 'Amount',
                fieldName: 'Amount',
                type: 'currency',
                typeAttributes: { currencyCode: 'EUR'},
                editable:'true'
            },
            {
                label: 'StageName',
                fieldName: 'StageName',
                editable:'true'
            }
        ]);
        
        
        var action = cmp.get("c.fetchOpp");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //   alert('value returned');
                cmp.set('v.mydata', response.getReturnValue());
            }
            else if (state === "ERROR") {
                // handle error
            }
        });
        $A.enqueueAction(action);
        
    },
    getSelectedName: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        // Display that fieldName of the selected rows
        for (var i = 0; i < selectedRows.length; i++){
            alert("You selected: " + selectedRows[i].opportunityName);
        }
        cmp.set('v.selectedRows',selectedRows.length);
    },
    
    changeValue : function (cmp,event){
        alert('saving');
        
        var draftValues = event.getParam('draftValues');
        alert(draftValues);
        helper.saveEdition(cmp, draftValues);
        //cmp.set('v.saveDraftValues', event.getParam('draftValues'));
    },
    
    handleSaveEdition1 : function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        alert('draftValues'+draftValues.size());        
        helper.saveEdition(cmp);
    },
    
    handleSaveEdition : function (cmp,event,helper){
        alert('hji');
      /*  var rows = cmp.get('v.mydata');
        var rowIndex = rows.indexOf(row);
        rows.splice(rowIndex, 1);
        alert(rows);
        cmp.set('v.mydata', rows);
        cmp.set('v.saveDraftValues', event.getParam('draftValues'));*/
        
        var draftValues = event.getParam('draftValues');
        var mydata = cmp.get('v.mydata');
        console.log('draftValues'+draftValues);
        helper.saveEdition(cmp,mydata,draftValues);
    },
    
    updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        console.log('selectedRows'+selectedRows);
        alert('selectedRows'+selectedRows.length);
        cmp.set('v.selectedRowsCount', selectedRows.length);
    }
    
    
})