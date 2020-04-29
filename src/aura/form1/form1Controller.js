({
    NavigationRec : function(component, event, helper) {
        
        component.find("navId").navigate({
            /* type: 'standard__recordPage',
            attributes: {
                recordId : '0012v00002LftmuAAB', // Hardcoded record id from given objectApiName
                actionName: 'view',  //Valid values include clone, edit, and view.
                objectApiName: 'Account', //The API name of the record’s object
            }*/
            
            /*  To redirect to another app
            type: "standard__app",
            attributes: {
                appTarget: "c__form1App",
            }   
        }, true);*/
            
           
            type: "standard__component",
            attributes: {
                "componentName": "c__australianTiming"    
            }
        }, true);
                                   
        }
                                         })