/**

 * @File Name          : CityTest.cls
 * @Description        : Collection Assignment 01:	On Account and Opportunity object there is city field and whenever i update the account city field with new value then atomatically change assosiated opportunity city field get updated
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 4:40:39 pm
* @Modification Log   : 

 **/


@isTest
public class CityTest {
    
 @isTest
   static void cityFetch()
    {
        
        List<Account> acc = [select city__c from Account where id =: '0015g00000ROvRbAAL'];
        for(Account a:acc){
            a.city__c ='Pune';
        }
        update acc; 
        
        City c = new City();
        c.getCity(acc);
        List<opportunity> opplist = [select id,city__c from opportunity where accountid =: '0015g00000ROvRbAAL'];
        
        for(opportunity o: opplist){
            System.assertEquals(o.city__c,'Mumbai');
        }
        
    }
    
}