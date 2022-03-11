/**
* @description       : Create a Trigger to Auto-Convert the Lead Records as the Customers upon Changing the Lead Status as "Closed - Converted".
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger HandleLeadRecords On Lead (After insert,After Update) {
    
    if(trigger.isupdate && trigger.isafter)
    {
        HandleLeadRecordHelper.createRecords(trigger.new);
    }
}