/**
 * @File Name          : SendMassEmails.cls
 * @Description        : 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 09/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class SendMassEmails {
    public static void SendEmail()
    {
        try{
            List<contact> conList=[Select id,lastName,email from contact where lastName like'A%'];
            List<Id> contactIds=new List<Id>();
            for(Contact c:conList)
            {
                contactIds.add(c.id);
            }
            
            EmailTemplate tem=[Select id,name from EmailTemplate where DeveloperName ='SalesNewCustomerEmail' limit 1];
            Messaging.MassEmailMessage Email = new Messaging.MassEmailMessage();
            Email.setTargetObjectIds(contactIds);
            Email.setSenderDisplayName('System administrator');
            Email.setTemplateId(tem.id);
            Messaging.sendEmail(new Messaging.MassEmailMessage[] { Email });
            system.debug(Email);
        }
        catch(Exception e){
            
        }
    }
}