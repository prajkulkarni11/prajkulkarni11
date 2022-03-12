/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-11 18:52:48
 * @ Modified by: Your name
 * @ Modified time: 2022-03-11 18:56:33
 * @ Description: After a Contact record is created, send an email to that person, welcoming them to Salesforce Platform
 */


public with sharingclass EmailOnContactCreation 
{
   public  static void sendEmailOnCreateContact(List<Contact> conList)
    {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        String[] mailIds = new String[]{};
        String mailId;
        String lastName;
        for(Contact con : conList)
        {
            lastName = con.LastName;
            if(con.email != NULL)
            {
        		mailId = con.email;    
            }
            mailIds.add(mailId);
        }
        email.setToAddresses(mailIds);
        email.setPlainTextBody('Hello '+ LastName +',' +
                               ' Thank You!!  for Contact Creation. Your Contact has been successfully created,'+ +
                               ' Welcome to the salesforce Platform.');
        email.setSubject('Regarding Your Contact Creation.');
        email.setSenderDisplayName('Vyom Salesforce Team');
        email.setreplyto('aishwarya1992salesforce@gmail.com');
        
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        emails.add(email);
        
        Messaging.sendEmail(emails);
    }    
    
}