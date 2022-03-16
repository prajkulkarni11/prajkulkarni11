/* 
*@ClassName:EmailNewContactRecord
*@Description: Send Email to Salary Person 
*@Author: Girish
*/
public with sharing class EmailNewContactRecord {
    public static void blockMain(Contact clist){
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        string[] toAddress = new string[]{clist.email};
                email.setToAddresses(toAddress);
        email.setSenderDisplayName('Salesforce Admin');
        string emailSubject = 'Welcome '+ clist.firstname + ' '+ clist.lastname  ;
            	email.setSubject(emailSubject);
        string emailContent = 'Dear '+ clist.firstname + ' '+ clist.lastname +', <br/>' + ' Thank you for joining us';
        email.setHtmlBody(emailContent);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
                    				

    }
}