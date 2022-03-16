/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 13:10:00
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 13:12:14
 * @ Description:send an email to customer when new salary record is created. (add cc,bcc,subject,plaintext,senderdisplayname).
 */



public with sharing class EmailCustomer {

    Static List<String> emails=new List<String>();
    Static List<Messaging.SingleEmailMessage> mails =   new List<Messaging.SingleEmailMessage>();

    public static void getCustomerData(List<Salary__c> salaryList){
        for(Salary__c sal:[Select id,Amount__c,Customer__r.email__c,Customer__r.Name from Salary__c where id IN:salaryList ])
        {

            if (sal.Customer__r.email__c!= null )
            {

                try{
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();    
                List<String> sendTo = new List<String>();
                sendTo.add(sal.Customer__r.email__c);
                mail.setToAddresses(sendTo);
                mail.setreplyto('aishwarya.shelake@vyomlabs.com');
                mail.setSenderDisplayName('Aishwarya');

                List<String> ccTo = new List<String>();
                ccto.add('aishwaryashelke075@gmail.com');
                mail.setCcAddresses(ccTo);   

                mail.setSubject('salary record is created');
                String body = 'Hello ' + sal.Customer__r.name + 'Salary ='+sal.Amount__c;
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