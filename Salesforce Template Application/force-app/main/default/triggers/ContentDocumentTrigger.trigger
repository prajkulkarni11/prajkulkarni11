/**
 * @File Name          : ContentDocumentTrigger.trigger
 * @Description        :  Trigger Assignment 12:Build solution to show count of number of Attachment (Classic +Lightening) on record detail page (Create custom filed to store count). Count should get updated on the basis of delete /Insert.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 4:50:39 pm
* @Modification Log   : 
 **/

trigger ContentDocumentTrigger on ContentDocument (after insert,after update,after delete,after undelete) {

    if(trigger.isAfter){

            ContentDocumentTriggerHandler.handleBeforeDelete();

    }

}