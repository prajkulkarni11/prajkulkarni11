public with sharing class UpdateHiringManager {
    public UpdateHiringManager() {

    }
    public static void fetchAccount(){
        HiringManager__c  hr = [SELECT Name ,Location__c,Contact__c
                              FROM HiringManager__c  
                               WHERE name='Apex HR'];
            
        hr.Location__c='Pune';
        hr.Contact__c= '9876543210';
         
         update hr;
        
        system.debug ('Updated Account:' +hr );
 
 
 }
}