/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 17:30:50
 * @ Description:Once the Hiring Manager Record has been Updated:
Sync the Changes into the Associated Child Record

 */


Trigger TriggerUpdateRecruiter on Hiring_Manager__c (After Update) {
    if(trigger.isUpdate){
        UpdateRecruiter.syncChange(trigger.new,trigger.oldmap);
    }  

}