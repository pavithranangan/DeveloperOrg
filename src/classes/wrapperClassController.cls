public class wrapperClassController {
    public List<cContact> contactList {get; set;}
    public List<Contact> selectedContacts{get;set;}
    public Integer value {get;set;}
    public List<cContact> getContacts() {
        if(contactList == null) {
            contactList = new List<cContact>();
            for(Contact c : [select Id, Name, Email, Phone from Contact limit 10]) {
                contactList.add(new cContact(c));
            }
        }
        return contactList;
    }
    public PageReference processSelected() {
        selectedContacts = new List<Contact>();
        for(cContact cCon : getContacts()) {
            if(cCon.selected == true) {
                selectedContacts.add(cCon.con);
            }
        }
        value = selectedContacts.size();
        System.debug('printingtcontc'+selectedContacts.size());
        return null;
    }
    public List<Contact> getSelectedContacts(){
        System.debug('printingtcontc inside get'+selectedContacts.size());
        if(selectedContacts.size()>0)
            return selectedContacts;
        else return null;
    }
    public class cContact {
        public Contact con {get; set;}
        public Boolean selected {get; set;}
        public cContact(Contact c) {
            con = c;
            selected = false;
        }
    }
}