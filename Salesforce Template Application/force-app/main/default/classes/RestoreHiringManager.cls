/**
 * @File Name          : RestoreHiringManager.cls
 * @Description        : Assignment 2: Write an apex program, to Re-Store the Hiring Manager Record back to the object based on the Specified Name.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
Public with sharing Class RestoreHiringManager {
    
    Public static void restoreHiringMgr() {
        // here ALL ROWS fetch records from recycle bin
        List<Hiring_Manager__c> backupDeletedAgain = [SELECT Id, Name FROM Hiring_Manager__c WHERE Name='Amar' ALL ROWS]; 
        try {
            if(backupDeletedAgain.size()>0){
                undelete backupDeletedAgain;
            }
        } catch (DmlException e) 
        {
            system.debug('exception error :'+e.getCause());
        }
    }
    
}