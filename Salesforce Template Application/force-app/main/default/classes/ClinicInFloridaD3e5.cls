/**
* @Class Name        : ClinicInFloridaD3e5
* @description       : Querying on clinic Object to find appointments in the city
* @author            : Girish
**/ 
public with sharing class ClinicInFloridaD3e5 {
    public static void main(){
         Clinic__C c = new Clinic__C();
        
        List<Clinic__c> cList = [SELECT Id,Name,max_no_of_appointments__c from clinic__c where state__c = 'Florida'];
        system.debug(cList);
    }
}