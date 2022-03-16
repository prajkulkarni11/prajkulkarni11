public with sharing class   HiringManagerDelete {
    public HiringManagerDelete()
    {        
    }
    
    Public static void getHR() {
        // here ALL ROWS fetch records from recycle bin
        List<HiringManager__c> backupDeletedAgain = [SELECT Id, Name FROM HiringManager__c WHERE Name='Aishwarya' ALL ROWS]; 
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