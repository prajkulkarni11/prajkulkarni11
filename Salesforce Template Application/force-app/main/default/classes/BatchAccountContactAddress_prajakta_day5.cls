/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 12:42:45
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 12:47:04
 * @ Description:Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".

 */

//1.	Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".(




global with sharing class BatchAccountContactAddress implements Database.Batchable<SObject>,Database.Stateful 
{
    public integer recordprocessed=0;
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT ID,BillingStreet, BillingCity, BillingState,BillingPostalCode,(SELECT ID, MailingStreet, MailingCity,MailingState, MailingPostalCode FROM Contacts) from account where billingcountry=\'USA\'');
    }
    global void execute(Database.BatchableContext bc, List<Account> Scope)
    {
        List<Contact> con=new List<Contact>();
        for(Account a:Scope)
        {
            for(Contact c:a.contacts)
            {
                c.MailingStreet = a.BillingStreet;
                c.MailingCity = a.BillingCity;
                c.MailingState = a.BillingState;
                c.MailingPostalCode = a.BillingPostalCode;
                recordprocessed=recordprocessed+1;
                con.add(c);
                
            }
            update con;
        }
    }
    global void finish(Database.BatchableContext bc)
    {
        System.debug('number of records processed'+recordprocessed);
        system.debug('total number of batches'+bc.getJobId());
    }
}
//BatchAccountContactAddress b=new BatchAccountContactAddress();
//Database.executeBatch(b,4);