/**
* @description       : Once the Hiring Manager Record has been Updated:Sync the Changes into the Associated Child Record.
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger SyncChangestoChildRecords on Hiring_Manager__c (After Update) {
    if(trigger.isUpdate){
        SyncChangestoChildRecordsHelper.syncChange(trigger.new,trigger.oldmap);
    }  
   
}