/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:56:24
 * @ Description: Upon Creating Hiring Manager:
Copy the Record into the Recruiter Object.  RecruiterTrigger

 */


trigger TriggerChangeManager on Recruiter__c (After Update) {
     if(trigger.isUpdate){
       ChangeManager.syncChangeToAssociate(trigger.new,trigger.oldmap);
    }  

} 