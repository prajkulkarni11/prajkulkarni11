

/**

 * @File Name          : TotalAnnualRevenue.cls
 * @Description        :Asynchronous Apex Assignment 01:Create a Batch Job to Synchronize the Account Record's Billing Address information into the associated Contact Record's Mailing Address by dividing the Account Records to the various batches of size "4".

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 2:40:39 pm
* @Modification Log   : 

 **/ 

public with sharing class TotalAnnualRevenue implements Database.Batchable<sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,annualrevenue from account where annualrevenue != null');
    }
    
    public void execute(Database.BatchableContext bc, List<Account> AccList){
        
        
        double total ;
        if(AccList!=null && !AccList.isEmpty()) {
            for(Account a : AccList){
                
                total = total + a.AnnualRevenue;           
            }
            
            System.debug('Total Annual revenue' + total);
            
        }
    }
    public void finish(Database.BatchableContext bc){
        
    }   
    
}