/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:55:36
 * @ Description:Customers upon Changing the Lead Status as "Closed - Converted"
 */


Trigger TriggerAutoConvert On Lead (After insert,After Update) {

    if(trigger.isupdate && trigger.isafter)
    {
        AutoConvertLead.createRecords(trigger.new);
    }
} 