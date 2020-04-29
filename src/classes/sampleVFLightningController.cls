public class sampleVFLightningController {
   /**
    * Webkul Software.
    *
    * @category  Webkul
    * @author    Webkul
    * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
    * @license   https://store.webkul.com/license.html
    */
    public String pbMode{get; set;}
    public Boolean ligtningMode {get; set;}
    
    public sampleVFLightningController(ApexPages.StandardSetController controller) {
     if(UserInfo.getUiThemeDisplayed() == 'Theme4d' && Apexpages.currentPage().getParameters().get('beLightning') == null)
     {
         pbMode = 'edit';
         ligtningMode = false;
     }
        else {
            pbMode = 'maindetail';
            ligtningMode = true;
        }
            
    }
}