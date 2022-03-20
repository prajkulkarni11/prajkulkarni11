
/**
 * @File Name          : CreateAccountEmailService.cls
 * @Description        :  Trigger Assignment 15:Create ‘Account’ object record based on email sent to the Salesforce. Email will contain the account details. [Hint: Use Email Services]
Email sample-
Name: Acme Industries
Type: Prospect
Phone: (212) 555-5555
Employees: 680	
etc…

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 5:50:39 pm
* @Modification Log   : 
 **/

global with sharing class CreateAccountEmailService implements Messaging.InboundEmailHandler
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelop)
    {
       
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String accname = email.subject;
        String des = email.plainTextBody;
        
        
        
    
        
        Account ac = new Account();
        ac.Name = accname;
         
        insert ac;
        return null;
    }
}