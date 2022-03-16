/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 20:59:41
 * @ Description:6.	Create a Trigger to Auto-Convert the Lead Records as the Customers upon Changing the Lead Status as "Closed - Converted".
 */


Trigger TriggerAutoConvert On Lead (After insert,After Update) {

    if(trigger.isupdate && trigger.isafter)
    {
        AutoConvertLead.createRecords(trigger.new);
    }
} 