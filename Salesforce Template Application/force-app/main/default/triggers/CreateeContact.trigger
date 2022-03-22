/**
 * @File Name          : CreateeContact.trigger
 * @Description        :  Trigger Assignment 23.Write a trigger to create related contact when an Account is created and associate that contact with that account.


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 2:30:39 pm
* @Modification Log   : 
 **/

trigger CreateeContact on Account (after insert, after update) {
    
     if(Trigger.isInsert) {
         
        AccountTriggerHandle.createContact(Trigger.new);
    }

}