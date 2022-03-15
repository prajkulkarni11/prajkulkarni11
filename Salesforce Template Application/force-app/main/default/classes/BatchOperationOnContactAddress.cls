/*@class             : ScheduleJob.cls 
* @description       : Operation on Contact using Batch Apex 
* @author            : Girish
*/

global with sharing class BatchOperationOnContactAddress implements Database.Batchable<SObject>,Database.Stateful 
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