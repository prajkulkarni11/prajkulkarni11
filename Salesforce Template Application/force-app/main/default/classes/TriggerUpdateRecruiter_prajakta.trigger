/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:59:38
 * @ Description:Upon Creating Hiring Manager:
Copy the Record into the Recruiter Object.  RecruiterTrigger
 */

Trigger TriggerUpdateRecruiter on Hiring_Manager__c (After Update) {
    if(trigger.isUpdate){
        UpdateRecruiter.syncChange(trigger.new,trigger.oldmap);
    }  

}