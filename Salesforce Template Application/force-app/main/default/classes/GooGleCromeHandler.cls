/**
 * @File Name          : GooGleCromeHandler.cls
 * @Description        :  Trigger Assignment 26:Create Three Objects (A, B, C). Object 'C' will be the junction object. Create status field on object 'A' and 'B' (note:- Status:New Open Closed).
 Write trigger to update status field of all related records,whenever there is change in status of record on either object(A,B).   


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 3:50:39 pm
* @Modification Log   : 
 **/


public with sharing class GooGleCromeHandler {
    
    public static void UpdateFieldGoogle(List<Google__c> newList){
        Set<id> Googleids = new Set<id>();
        
        for(Google__c v:newlist)
        {
            Googleids.add(v.Id);
        }
        
        GoogleCrome__c cid=[select id,status__c from GoogleCrome__c WHERE Google__c =: Googleids];
        
        for(Google__c b: newlist){
            
            if(b.Status__c=='Closed'){
                cid.Status__c='Closed';
            }
            if(b.Status__c=='New'){
                cid.Status__c='New';
            }
            if(b.Status__c=='Old'){
                cid.Status__c='Old';
            }
        }
        
        update cid;
        
    }
    
    public static void UpdateFieldCrome(List<Crome__c> newList){
        Set<id> Cromeids = new Set<id>();
        
        for(Crome__c v:newlist)
        {
            Cromeids.add(v.Id);
        }
        
        GoogleCrome__c cid=[select id,status__c from GoogleCrome__c WHERE Crome__c =: Cromeids];
        
        for(Crome__c b: newlist){
            
            if(b.Status__c=='Closed'){
                cid.Status__c='Closed';
            }
            if(b.Status__c=='New'){
                cid.Status__c='New';
            }
            if(b.Status__c=='Old'){
                cid.Status__c='Old';
            }
        }
        
        update cid;
        
    }
}