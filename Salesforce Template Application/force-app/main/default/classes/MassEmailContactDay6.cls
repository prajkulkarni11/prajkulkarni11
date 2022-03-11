/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-11 18:52:47
 * @ Modified by: Your name
 * @ Modified time: 2022-03-11 18:57:13
 * @ Description:2.	send mass email message to contacts whose name starts with a
 */


public with sharing class MassEmailContact 
{
    public static void SendEmail()
    {
        List<contact> conlist=[Select id ,lastName from contact where firstName like 'a%' ];
        List<Id> ids= new List<Id>();
        for(Contact c:conlist)
        {
            ids.add(c.id);
        }
        EmailTemplate tem=[Select id,name from EmailTemplate where name = 'TutorialKart Email Template' limit 1];
        Messaging.MassEmailMessage Email = new 
        Messaging.MassEmailMessage();
        Email.setTargetObjectIds(ids);
        Email.setSenderDisplayName('Salesforce System Admin Here');
        Email.setTemplateId(tem.id);
        Messaging.sendEmail(new Messaging.MassEmailMessage[] { Email });
        system.debug(Email);
    }
}