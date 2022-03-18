/**
 * @File Name          : ContactErrorStage.Trigger
 * @Description        :  Trigger Assignment 25:Write a trigger on contact to show an error if status changes from new to closed and record should get saved if status changes from New to Open or Open to closed.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 4:50:39 pm
* @Modification Log   : 
 **/

trigger ContactErrorStage on Contact (before insert, before update) {
    
    if(trigger.isBefore && trigger.isUpdate){
        ContactStageError.contactError(trigger.newMap,trigger.oldMap);      
    }
        
}