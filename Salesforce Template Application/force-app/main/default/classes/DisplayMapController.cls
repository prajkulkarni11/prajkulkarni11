/**
 * @File Name          : DisplayMapController.cls
 * @Description        : Collection Assignment 9-Create a LWC component to display current location on google map of account.

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 22/03/2022, 4:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class DisplayMapController {
    public DisplayMapController() {

    }

    @AuraEnabled (cacheable=true)
    public static List<Account> getOfficeLocations(String accountNameInitial){
        String str = accountNameInitial + '%';
        return [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry 
                FROM Account 
                WHERE Name LIKE :str];       
    }
}