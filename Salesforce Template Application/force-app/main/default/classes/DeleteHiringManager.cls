
/**
 * @File Name          : ContactSearch.js
 * @Description        : 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 01/03/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/


public with sharing class DeleteHiringManager {
    
    public static void method1(){
        
        HiringManager__c[] Hm = [SELECT Id, FirstName__c FROM HiringManager__c 
                                     WHERE FirstName__c LIKE 'Apex HR%']; 
        try {
            delete Hm;
            
        } catch (DmlException e) {
           
        }
        System.debug('You deleted one record');
    }
    
    
}