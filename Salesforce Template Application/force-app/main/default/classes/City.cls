
/**

 * @File Name          : City.cls
 * @Description        : Collection Assignment 01:	On Account and Opportunity object there is city field and whenever i update the account city field with new value then atomatically change assosiated opportunity city field get updated
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 4:40:39 pm
* @Modification Log   : 

 **/

public with sharing class City {
    
    public void getCity(List<account> acclist){
    String city,accid;

        for(account a: acclist){
            accid = a.id;
            city = a.City__c;
        }        

        List<opportunity> opplist = [select id,city__c from opportunity where accountid =: accid];

        for(opportunity o: opplist){
            o.city__c = city;
        }
        update opplist;
    
    }

}