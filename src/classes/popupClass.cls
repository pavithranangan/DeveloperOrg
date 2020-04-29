public class popupClass {
public Boolean displayPopup {get;set;}

    public popupClass(ApexPages.StandardController controller) {

    }
    
    public void showPopup()
    {
        
    displayPopup = true;

    System.debug('pop true');
    }
    
    public void closePopup() {
        displayPopup = false;
            System.debug('pop false');
    }
    
    public void redirectPopup()
    {
    displayPopup = false;
        System.debug('val');
        //Please uncomment below 3 statements and replace YourObjectId
       // PageReference p=new Pagereference('/'+YourObjectId);
       //  p.setRedirect(true);
       //  return p;
        
    }
    
}