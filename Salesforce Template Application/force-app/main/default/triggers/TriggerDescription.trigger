/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 17:43:07
 * @ Description:2.	There is a description field on Account and also on Contact.
 *  Whenever the account description is updated, the related Contact description should also be updated but
  * I should be able to identify from the description which account this contact is related to.
 */


trigger TriggerDescription on Account (after update) {
if(trigger.isAfter && trigger.isUpdate)
{
    DescriptionUpdate.accountUpdate(trigger.new, trigger.oldmap);
}
}