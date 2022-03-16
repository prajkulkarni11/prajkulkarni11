/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-08 14:32:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:49:50
 * @ Description:fetch name,max_no_of_appointments of all the clinics that are in  florida
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