public class emailTry {
    
    public void  sendingEmail()
    {	
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'kayammagayu@gmail.com'}; 
            String[] ccAddresses = new String[] {'gayathri.v@congruentindia.com'};
                
                
                // Assign the addresses for the To and CC lists to the mail object.
                mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        
        // Specify the address used when the recipients reply to the email. 
        mail.setReplyTo('support@acme.com');
        
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Salesforce Support');
        
        // Specify the subject line for your email address.
        mail.setSubject('New Case Created : ' + case.Id);
        
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        
        // Specify the text content of the email.
        mail.setPlainTextBody('Your Case:  has been created.');
        
        mail.setHtmlBody('Your case:To view your case');
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    } 
}