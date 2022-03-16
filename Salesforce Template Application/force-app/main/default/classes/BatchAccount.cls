/**
 * @ Author: Aishwarya 
 * @ Create Time: 2022-03-10 12:38:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 17:06:36
 * @ Description://2.	Create a Batch Class, to Calculate the Total Annual Revenue of all the Account Records in the object, by dividing them to the various batches of size 4. 

 */


Global with sharing class  BatchAccount implements Database.Batchable<SObject>,Database.Stateful
{
 Global Decimal totalAnnualRevenue = 0.0;
 
GLOBAL Database.QueryLocator START(Database.BatchableContext bContext)
 {
 string accountsQuery = 'Select id, name, annualrevenue from Account where annualrevenue !=null';
 return Database.getQueryLocator(accountsQuery);
 }
 
 GLOBA void EXECUTE(Database.BatchableContext bContext, List<Account> AccountsToProcess)
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
 
 GLOBAL void FINISH(Database.BatchableContext bContext)
 {
 system.debug('Batch Job Id is.....: '+ bContext.getJobId());
 System.debug('total revenue is='+totalAnnualRevenue);
 
 }

}