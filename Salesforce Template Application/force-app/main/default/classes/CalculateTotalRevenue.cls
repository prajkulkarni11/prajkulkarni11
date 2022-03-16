/*@Class Name        : CalculateTotalRevenue 
* @description       : Total annual revenue on Account
* @author            : Girish
**/
global with sharing class CalculateTotalRevenue implements database.Batchable<Sobject>,Database.Stateful 
{    
    decimal total=0.0;

    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'Select id, name, annualrevenue from Account where annualrevenue != null';
        return Database.getQueryLocator(query);        
    }    
    global void execute(Database.BatchableContext bc, List<Account> acc)
    {
        if(!acc.isEmpty())
        {
            for(Account a : acc)
            {               
                total=total+a.AnnualRevenue;
            }
        }
        System.debug('total Revenue of all account=' +total);
    }

    global void finish(Database.BatchableContext bc)
    {
        System.debug('total Revenue of all account=' +total);
    }
}