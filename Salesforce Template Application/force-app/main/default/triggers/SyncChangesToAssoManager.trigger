/**
* @description       : Once the Recruiter Record has been Updated: Sync the Changes to the Associated Hiring Manager Record.

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
trigger SyncChangesToAssoManager on Recruiter__c (After Update) {
     if(trigger.isUpdate){
       SyncChangesToAssoManagerHelper.syncChangeToAssociate(trigger.new,trigger.oldmap);
    }  
    
}