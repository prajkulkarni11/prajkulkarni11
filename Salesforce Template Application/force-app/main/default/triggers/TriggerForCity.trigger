/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 17:42:18
 * @ Description:1.	On Account and Opportunity object there is city field and whenever i update the account city
 *   field with new value then atomatically change assosiated opportunity city field get updated
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