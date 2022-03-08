public with sharing class FetchHospital {
    public FetchHospital() {

    }
    public static List<Hospital__c> searchForAcc(){ 
        
        List<Hospital__c> hosp = [select id, name, Max_No_Of_Appointments__c from Hospital__c where Address__c='florida'];
        
        system.debug(+hosp);
        return hosp;
    }
}