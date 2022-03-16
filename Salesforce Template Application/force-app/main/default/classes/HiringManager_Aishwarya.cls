public with sharing class HiringManager
 {
     Public HiringManager() 
     {
         system.debug('this is constructor');
     }
      void deleteRec()
     {
        List<HiringManager__c>hr=new List<HiringManager__c>();
        hr = [SELECT Name FROM HiringManager__c WHERE Name LIKE 'Is%'];
        delete hr;
    }
    
}