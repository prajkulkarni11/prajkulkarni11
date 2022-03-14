/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 13:10:00
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 13:11:25
 * @ Description:send an email to customer when new salary record is created. (add cc,bcc,subject,plaintext,senderdisplayname)
 */



trigger customerTrigger on Salary__c (After insert) {

    if(Trigger.IsAfter){
        EmailCustomer.getCustomerData(Trigger.new);
    }

} 