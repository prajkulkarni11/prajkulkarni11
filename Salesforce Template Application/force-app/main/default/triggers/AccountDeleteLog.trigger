/**
 * @File Name          : AccountDeleteLog.trigger
 * @Description        :  Trigger Assignment 17:Create custom object ‘Accounts Delete Log’ with fields:  Deleted Account Name, Account Deleted Date, Account Deleted Time. When any record from Account object is deleted, its name & deletion date/ time should be saved in this ‘Accounts Delete Log’ object.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 7:50:39 pm
* @Modification Log   : 
 **/


trigger AccountDeleteLog on Account (before delete) {
    
    if(trigger.isBefore && trigger.isDelete){
        List<AccountsDeleteLog__c> delLogList = new List<AccountsDeleteLog__c>();
        
        for(Account acc : Trigger.old)
        {
            AccountsDeleteLog__c delLog = new AccountsDeleteLog__c();
            delLog.Name = acc.Name;
            delLog.Account_Deleted_Time__c = Datetime.now().time();
            delLog.Account_Deleted_Date__c = Date.today();      
            delLogList.add(delLog);
        }
        if(delLogList.size()>0)
        {
            insert delLogList;
        }
    }
}