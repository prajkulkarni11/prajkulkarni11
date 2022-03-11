/**
* @description       : Upon Creating Hiring Manager: Copy the Record into the Recruiter Object.

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger CopyRecordIntoRecruiter on Hiring_Manager__c (After Insert) {
     if(trigger.isInsert){
        CopyRecordIntoRecruiterHelper.copyRecord(trigger.new);
    } 
   
}