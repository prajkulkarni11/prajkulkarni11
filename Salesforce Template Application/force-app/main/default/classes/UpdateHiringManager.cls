
/**
 * @description       : Apex Assignment
 * @author            : Swapnil Thalal
 * @group             : 
 * @last modified on  : 02-03-22
 * @last modified by  : Swapnil Thalal
**/


public with sharing class UpdateHiringManager {
    
    public static void method1(){
        
        
        HiringManager__c Hm = [SELECT Id, FirstName__c,Location__c,ContactNumber__c FROM HiringManager__c 
                                 WHERE FirstName__c LIKE 'Apex HR%']; 
        
            Hm.Location__c = 'pune';
            Hm.ContactNumber__c = 0876543210 ;
        
            update Hm;
       
        System.debug('You Update one record');
    }
    
    
}