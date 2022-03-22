/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_28.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:52 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class Assignment_28 implements database.Batchable<sObject> {
    
    global database.QueryLocator start(database.BatchableContext bc ){
       
        
        return Database.getQueryLocator ([SELECT Id, Name, Total_Amount__c, ( SELECT ID, Amount FROM Opportunities  where stageName = 'Closed Won') FROM Account]);
        
    }

global void execute(database.BatchableContext bc, list<Account> scope ){
    
    
    for( Account acc : scope ) {
        Decimal sum = 0;
        for ( Opportunity opp : acc.opportunities ) {
            
            sum = sum + opp.Amount ;
            
        }
        
        acc.Total_Amount__c = sum;
        
    }
    
    update scope;
    
}
global void finish(database.BatchableContext bc ) {
    
}
}