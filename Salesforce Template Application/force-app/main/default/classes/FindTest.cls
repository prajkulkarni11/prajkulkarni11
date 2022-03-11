/**
 * @File Name          : FindTest.cls
 * @Description        : find test in accounts lead and opportunities
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class FindTest {
    
    public static void findTestInAccountLeadOpportunites(){
        try{
            List<List<sObject>> searchList = [FIND 'test' IN ALL FIELDS Returning Account(Name), Lead(Name),Opportunity(Name)];
            List<Account> acc = (Account[])searchList[0];
            List<Lead> lead =(Lead[])searchList[1];
            List<Opportunity> oppo = (Opportunity[])searchList[2];            
            for(Account ac :acc){
                System.debug('Account Result - '+ac.Name);
            }
            for(Lead l :lead){
                System.debug('Lead - '+l.Name);
            }
            for(Opportunity o : oppo){
                System.debug('Oppo - '+o.Name);
            }
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
            
        }
    }
}