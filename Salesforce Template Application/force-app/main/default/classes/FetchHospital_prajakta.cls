/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:33:12
 * @ Description:Fetch Name, max_no_of_appointments__c of all the clinics that are in Florida.(FetchHospital)
 */



public with sharing class FetchHospital {
    public FetchHospital() {

    }
    public static List<Hospital__c> searchForAcc(){ 
        
        List<Hospital__c> hosp = [select id, name, Max_No_Of_Appointments__c from Hospital__c where Address__c='florida'];
        
        system.debug(+hosp);
        return hosp;
    }
}