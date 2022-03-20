/**
 * @File Name          : ContentDocumentTriggerHandler.cls
 * @Description        :  Trigger Assignment 12:Build solution to show count of number of Attachment (Classic +Lightening) on record detail page (Create custom filed to store count). Count should get updated on the basis of delete /Insert.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 3:50:39 pm
* @Modification Log   : 
 **/

public with sharing class ContentDocumentTriggerHandler {
    
    public static void handleBeforeDelete(){
        
        fileDelete();
        
    }
    
    public static void fileDelete(){
        
        Set<Id> contentDocumentIDs = new Set<Id>();
        
        for(ContentDocument cd : (List<ContentDocument>) Trigger.new){
            
            contentDocumentIDs.add(cd.Id);
            
        }
        
        System.debug('contentDocumentIDs: ' + contentDocumentIDs);
        System.debug('contentDocumentIDs.size(): ' + contentDocumentIDs.size());
        
        List<ContentDocumentLink> contentDocumentLinks = new List<ContentDocumentLink>(
            [SELECT Id, LinkedEntityId
             FROM ContentDocumentLink
             WHERE ContentDocumentId IN :contentDocumentIDs
            ]);
        
        Set<Id> parentQuoteDocumentIds = new Set<Id>();
        
        for(ContentDocumentLink cdl : contentDocumentLinks){
            
            parentQuoteDocumentIds.add(cdl.LinkedEntityId);
            
        }
        updateQuoteDocumentFileCount(parentQuoteDocumentIds);
    }
    
    @future
    public static void updateQuoteDocumentFileCount(set<Id> parentQuoteDocumentIds){
        
        System.debug('parentQuoteDocumentIds: ' + parentQuoteDocumentIds);
        System.debug('parentQuoteDocumentIds.size(): ' + parentQuoteDocumentIds.size()); 
        
        List<Opportunity> quoteDocList = [
            SELECT Id, 
            (SELECT Id FROM ContentDocumentLinks)
            FROM Opportunity
            WHERE Id IN :parentQuoteDocumentIds];
        
        System.debug('quoteDocList: ' + quoteDocList);
        System.debug('quoteDocList.size(): ' + quoteDocList.size()); 
        
        
        for(Opportunity qd : quoteDocList){
            
            qd.Count_Atachment__c = qd.ContentDocumentLinks.size();
            
        }
        
        update quoteDocList;
        
    }
}