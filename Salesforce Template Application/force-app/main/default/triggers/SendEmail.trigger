/**
 * @File Name          : SendEmail.trigger
 * @Description        :  Trigger Assignment 19:After a Contact record is created, send an email to that person, welcoming them to Salesforce Platform. [Restriction: Cannot use email templates/ alerts for this]
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 10:30:39 pm
* @Modification Log   : 
 **/

trigger SendEmail on Contact (after insert) {
    
    set<id> ContactId = new set<id>();
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    List<String> sendTo = new List<String>();
        
    for(Contact con : trigger.new){
        if(con.Email!=null){
            Contact conList =[SELECT Email from contact WHERE Id=:con.id];
            
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            sendTo.add(conList.email);
            mail.setToAddresses(sendTo);
            mail.setSubject('Contact_Is_created_By_Swap');
            
            String body = 'created.';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        
    }
    Messaging.sendEmail(mails);
    
}