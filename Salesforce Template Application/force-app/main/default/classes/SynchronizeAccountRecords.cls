/**
* @Class Name        : SynchronizeAccountRecords 
* @description       : Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
global with sharing class SynchronizeAccountRecords Implements Database.Batchable<Sobject> {
    
    global database.QueryLocator start(database.BatchableContext db)
    {
        return database.getQueryLocator('SELECT ID,BillingStreet, BillingCity,BillingState,BillingPostalCode,(SELECT ID, MailingStreet,MailingCity,MailingState,MailingPostalCode FROM Contacts) from account');
    }
    
    global static void execute(database.BatchableContext cb,List<Account>accList)
    {
        try{
            List<contact>conList=new List<contact>();
            for(Account acc:accList)
            {    
                for(contact con:acc.contacts)
                {
                    con.MailingStreet= acc.BillingStreet;
                    con.MailingCity= acc.BillingCity;
                    con.MailingState= acc.BillingState;
                    con.MailingPostalCode= acc.BillingPostalCode;
                    con.MailingCountry= acc.BillingCountry;
                    
                    con.AccountId=acc.Id;
                    conlist.add(con);
                }
            }
            
            update conlist;
        }catch(Exception e){
            
        }
    }
    
    global static void finish(database.BatchableContext db)
    {
        system.debug('Finish Method');
    }
}