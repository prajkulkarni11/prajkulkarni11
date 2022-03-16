/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:48:07
 * @ Description: Fetch the records of clinic whose location is florida
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