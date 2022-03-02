public class DeleteHiringManager {
    
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