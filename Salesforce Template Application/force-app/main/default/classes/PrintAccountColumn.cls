/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-22 16:21:07
 * @ Modified by: Your name
 * @ Modified time: 2022-03-22 16:22:25
 * @ Description: //2.create visual force page for the custom object through controller class and display through 
//pageblocktable,datatable. 
 */


public with sharing class PrintAccountColumn {
     public string recid{get;set;}    
    // public list<Account> Acclst{get;set;}
      public list<Position__C> pos {get;set;}
       public PrintAccountColumn(){
        //Acclst = [SELECT Id, AnnualRevenue,Name, Phone,Type, BillingCountry, BillingPostalCode, BillingState, BillingCity, BillingStreet FROM Account LIMIT 10];
        pos= [SELECT Id,name,Functional_Area__c,Open_Date__c,Close_Date__c,Status__c,Job_Level__c,Job_Description__c,Type__c,Hiring_Manager__c from position__c LIMIT 10 ];
    }
}