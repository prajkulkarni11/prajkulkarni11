/**
 * @File Name          : ContactStageError.cls
 * @Description        :  Trigger Assignment 25:Write a trigger on contact to show an error if status changes from new to closed and record should get saved if status changes from New to Open or Open to closed.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 3:50:39 pm
* @Modification Log   : 
 **/

public with sharing class ContactStageError {
    
    
    public static void contactError(Map<Id,Contact> newContactMap, Map<Id,Contact> oldContactMap){
        for(Contact obj : newContactMap.values()){
            if(oldContactMap.get(obj.Id).status__c == 'New' && newContactMap.get(obj.Id).status__c == 'Closed'){
                
                
                obj.status__c.adderror('Status_Can_Not_Change:- "New" to "Close"'); 
            }
        }
    }
    
    
}