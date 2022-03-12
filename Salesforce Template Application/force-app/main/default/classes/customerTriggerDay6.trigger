/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-11 18:52:47
 * @ Modified by: Your name
 * @ Modified time: 2022-03-11 18:55:11
 * @ Description:1.	send an email to customer when new salary record is created. (add cc,bcc,subject,plaintext,senderdisplayname).   
 */



trigger customerTrigger on Salary__c (After insert) {

    if(Trigger.IsAfter){
        EmailCustomer.getCustomerData(Trigger.new);
    }

} 