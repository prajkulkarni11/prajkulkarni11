
/**
 * @File Name          : MassEmailMessage.cls
 * @Description        : Apex Assignment-send mass email message to contacts whose name starts with a.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 04/03/2022, 4:40:39 pm
 * @Modification Log   : 
 
**/


public with sharing class MassEmailMessage
{
    public static void SendEmail()
    {
        List<String> email=new List<String>{'swapnil.thalal@vyomlabs.com','swapnil141615@gmail.com'};
        List<contact>lstcon=[Select id from contact where FirstName like 'a%' limit 2];
        List<Id>lstids= new List<Id>();
        for(Contact c:lstcon)
        {
            lstids.add(c.id);
        }
        EmailTemplate et=[Select id from EmailTemplate where name ='ContactEmailTemplate' limit 1];
        
        Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
        mail.setTargetObjectIds(lstIds);
        mail.setSenderDisplayName('System Admin');
        mail.setTemplateId(et.id);
        Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});
    }
}