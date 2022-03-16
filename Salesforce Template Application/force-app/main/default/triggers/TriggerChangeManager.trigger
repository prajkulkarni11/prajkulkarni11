/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 17:44:27
 * @ Description:iii) Once the Recruiter Record has been Updated:
*    Sync the Changes to the Associated Hiring Manager Record.

 */


trigger TriggerChangeManager on Recruiter__c (After Update) {
     if(trigger.isUpdate){
       ChangeManager.syncChangeToAssociate(trigger.new,trigger.oldmap);
    }  

} 