
/**
 * @File Name          : UndeleteHiringManager.cls
 * @Description        : Apex Assignment-Write an apex program, to Re-Store the Hiring Manager Record back to the object based on the Specified 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 03/03/2022, 2:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class UndeleteHiringManager {
    
    public static void method1(){
        
        HiringManager__c[] Hm = [SELECT Id, FirstName__c FROM HiringManager__c 
                                 WHERE FirstName__c = 'CC' ALL ROWS]; 
        try {
            undelete Hm;
        } catch (DmlException e) {
            
        }
        System.debug('You undeleted one record');
    }
    
    
}