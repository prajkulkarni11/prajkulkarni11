/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assign_20.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Tuesday, March 22nd 2022, 10:13:45 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class Assign_20 implements database.Batchable<sObject>, database.stateful {

    global database.QueryLocator start(database.BatchableContext bc){
        string query='select Name,Priority__c,Response_Date__c,CreatedDate from Complaint__c';
        
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<Complaint__c> scope){
       
        for(Complaint__c c:scope){
            
            if(c.Priority__c=='Critical'){
                c.Response_Date__c=c.CreatedDate.addHours(6);
             
            }
            else if(c.Priority__c=='High'){
                c.Response_Date__c=c.CreatedDate.addDays(2);
             
            }
            else if(c.Priority__c=='Medium'){
                c.Response_Date__c=c.CreatedDate.addDays(5);
            
            }
            else if(c.Priority__c=='Low'){
                c.Response_Date__c=c.CreatedDate.addDays(10);
                
            }
         
       }
         update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}