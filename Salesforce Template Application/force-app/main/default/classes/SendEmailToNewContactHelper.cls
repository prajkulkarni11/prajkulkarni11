/**
 * @File Name          : SendEmailToNewContact.cls
 * @Description        : 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 09/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class SendEmailToNewContactHelper {
    
    public static void sendEmailToContact(List<Contact> listContacts){
        String body='Hello,Welcome to salesforce platform';
        List<String> toAddress=new List<String>();
        
        for(Contact c:listContacts)
        {
            toAddress.add(c.Email);
        }
        
        Messaging.SingleEmailMessage Email= new Messaging.SingleEmailMessage();
        Email.setToAddresses(toAddress);  
        Email.setSubject('Welcome Message');
        Email.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {Email});
        
    }
}