
/**

 * @File Name          : SynchronizeAccountRecord.cls
 * @Description        :Asynchronous Apex Assignment 01:Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 1:40:39 pm
* @Modification Log   : 

 **/ 

public with sharing class SynchronizeAccountRecord implements Database.Batchable<sobject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,name,description,(select id,description from Contacts)from Account where name =\'swapnil\' ');
    }
    
    public void execute(Database.BatchableContext bc, List<Account> AccList){
        
        List<Contact> conList = new List<Contact>();
        if(AccList!=null && !AccList.isEmpty()) {
            for(Account acc : AccList){
                for(Contact con : acc.contacts){
                    con.Description = acc.Description;
                    conList.add(con);
                }
                
            }
            
            update conList;
            
        }
    }
    public void finish(Database.BatchableContext bc){
        
    }    
    
}