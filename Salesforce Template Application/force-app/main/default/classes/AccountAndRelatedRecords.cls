/**
 * @File Name          : AccountAndRelatedRecords.cls
 * @Description        : Assignment 7: Write an apex program, to fetch the Account Record based on the specified name and fetch all the Related Contacts, Opportunities, and Cases associated with the account.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class AccountAndRelatedRecords {
        
    public static void displayAccountRelatedRecords()
    {
        //soql query to fetch records from database
        List<Account> accountList=[select id,name,(select id,name from contacts),(select id,CaseNumber from cases),(select id,name from opportunities) from Account where name='Amar'];
        List<id> contactList=new List<id>();
        List<id> opportunitiesList=new List<id>();
        List<id> caseList=new List<id>();
        try{           
            
            for(Account acc:accountList)
            {
                for(Contact con:acc.contacts)
                {
                    contactList.add(con.id);
                }
                
                for(opportunity opp:acc.opportunities)
                {
                    opportunitiesList.add(opp.id);
                }
                
                
                for(case casen:acc.cases)
                {
                    caseList.add(casen.id);
                }
                
            }
            system.debug('contacts records:'+contactList);
            system.debug('opportunity records:'+opportunitiesList);
            system.debug('cases records:'+caseList);
        }
        catch(Exception e){
        system.debug('exception error :'+e.getCause());
    }
    }
    
}