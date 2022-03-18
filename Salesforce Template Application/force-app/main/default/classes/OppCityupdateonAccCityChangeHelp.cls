/* *
 * @ClassName : OppCityupdateonAccCityChangeHelp
 * @Description : Test class for Opp city update when acc city is updated 
 * @author : Girish
*/

@isTest
public with sharing class OppCityupdateonAccCityChangeHelp {
	
    @isTest static void testBlock(){
        Account acc = new Account();
        acc.Name = 'Demo1';
        acc.City__c = 'KLBG';
        insert acc;
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        Opp.CloseDate = date.today();
        opp.StageName = 'Closed Won';
        opp.AccountId = acc.Id;
        insert opp;
        
        acc.City__c = 'Pune';
        update acc;
    }
}