/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:57:56
 * @ Description: On Account and Opportunity object there is city field and whenever i update the account city field with new value then atomatically change assosiated opportunity city field get updated

 */

trigger TriggerForCity on Account (after update) {
    if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {
            CityAccountOpp.getvalue(Trigger.new,trigger.OldMap);
        }
    }
}