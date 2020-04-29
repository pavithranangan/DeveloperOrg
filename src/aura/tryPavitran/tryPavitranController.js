({
    var : function(component,event,helper){
    alert(component.get("v.simpleRecord").Applicant__c);
    var value=component.get("v.simpleRecord").Applicant__c;
    helper.doinit(component,event,value);
}
})