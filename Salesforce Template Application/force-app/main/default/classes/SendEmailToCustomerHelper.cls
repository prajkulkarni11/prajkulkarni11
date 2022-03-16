/**
 * @File Name          : SendEmailToCustomerHelper.cls
 * @Description        : 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 09/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class SendEmailToCustomerHelper {
    
    Static List<String> emails=new List<String>();
    Static List<Messaging.SingleEmailMessage> mails =   new List<Messaging.SingleEmailMessage>();

    public static void getCustomerData(List<Salary__c> salaryList){
        for(Salary__c sal:[Select id,Salary_Creadited_Amount__c,customer__r.email__c,customer__r.Name__c from Salary__c where id IN:salaryList ]){
            
            if (sal.Customer__r.email__c!= null )
            {
                
                try{
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();    
                List<String> sendTo = new List<String>();
                sendTo.add(sal.Customer__r.email__c);
                mail.setToAddresses(sendTo);
                mail.setReplyTo('amar.giram@Vyomlabs.com');
                mail.setSenderDisplayName('Amar Giram');
                
                List<String> ccTo = new List<String>();
                ccTo.add('amarng777@gmail.com');
                mail.setCcAddresses(ccTo);   
                
                mail.setSubject('salary record is created');
                String body = 'Hello ' + sal.Customer__r.name__c + 'Salary ='+sal.Salary_Creadited_Amount__c;
                mail.setHtmlBody(body);
                
                mails.add(mail);
                Messaging.sendEmail(mails);
                }
                catch(Exception e){
                    
                }
            }
        }
    }
    
}