public class InlineEditInVFController {

public List <Opportunity> acc {get;set;}
public InlineEditInVFController(){
acc= Database.query('select Name,Amount,CloseDate from Opportunity Limit 10');
}
public PageReference quickUpdat(){
try{
update acc;
return ApexPages.CurrentPage();
}catch(Exception e){
System.debug('@@@Error');
return null;
}
}

}