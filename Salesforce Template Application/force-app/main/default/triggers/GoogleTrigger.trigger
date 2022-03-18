
/**
 * @File Name          : GoogleTrigger.Trigger
 * @Description        :  Trigger Assignment 26:Create Three Objects (A, B, C). Object 'C' will be the junction object. Create status field on object 'A' and 'B' (note:- Status:New Open Closed).
 Write trigger to update status field of all related records,whenever there is change in status of record on either object(A,B).   


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 2:50:39 pm
* @Modification Log   : 
 **/

trigger GoogleTrigger on Google__c (before update) {
    
    GooGleCromeHandler.UpdateFieldGoogle(Trigger.new);    
        
}