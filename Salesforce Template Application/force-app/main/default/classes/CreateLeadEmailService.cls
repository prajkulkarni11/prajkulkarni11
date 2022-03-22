/**
 * @File Name          : CreateLeadEmailService.cls
 * @Description        :  Trigger Assignment 30.create a custom email to lead functionally to generate a lead
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 21-03-22, 2:30:39 pm
* @Modification Log   : 
 **/

global with sharing class CreateLeadEmailService implements Messaging.InboundEmailHandler
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelop)
    {
       
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String Namee = email.subject;
        String des = email.plainTextBody;
        List<String> str1 = des.split(',');
        List<String> str3 = new List<String>();
        for(String str : str1){
            String str2 = str.substringAfter('=');
            str3.add(str2);
        }
        
        Lead l = new Lead();
        
        l.LastName = Namee;
        l.Industry = str3[0];
        l.Company = str3[1];
        l.Status = str3[2];
       
        //industry,Company
        insert l;
        return null;
    }
}