/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:57:08
 * @ Description: There is a description field on Account and also on Contact. Whenever the account description is updated, the related Contact description should also be updated but I should be able to identify from the description which account this contact is related to.
 */

trigger TriggerDescription on Account (after update) {
if(trigger.isAfter && trigger.isUpdate)
{
    DescriptionUpdate.accountUpdate(trigger.new, trigger.oldmap);
}
}