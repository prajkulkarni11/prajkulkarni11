//2.	Create a Batch Class, to Calculate the Total Annual Revenue of all the Account Records in the object, by dividing them to the various batches of size 4. 
Global with sharing class  BatchAccount implements Database.Batchable<SObject>, 
Database.Stateful
{
 Global Decimal totalAnnualRevenue = 0.0;
 
Global Database.QueryLocator Start(Database.BatchableContext bContext)
 {
 string accountsQuery = 'Select id, name, annualrevenue from Account where annualrevenue !=null';
 return Database.getQueryLocator(accountsQuery);
 }
 
 Global void Execute(Database.BatchableContext bContext, List<Account> accountsToProcess)
 {
 if(! accountsToProcess.isEmpty())
 {
 for(Account obj : accountsToProcess)
     {
 Account acc = (Account) obj;
 //Account acc = new Account ();
 totalAnnualRevenue  = totalAnnualRevenue + obj.AnnualRevenue;
 }
 }
 }
 
 Global void Finish(Database.BatchableContext bContext)
 {
 system.debug('Batch Job Id is.....: '+ bContext.getJobId());
 System.debug('total revenue is='+totalAnnualRevenue);
 
 }

}