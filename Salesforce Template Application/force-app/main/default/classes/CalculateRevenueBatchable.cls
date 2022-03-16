/**
* @Class Name        : CalculateRevenueBatchable 
* @description       : Create a Batch Class, to Calculate the Total Annual Revenue of all the Account Records in the object, by dividing them to the various batches of size 4.
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/

global with sharing class CalculateRevenueBatchable implements database.Batchable<Sobject>,Database.Stateful 
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