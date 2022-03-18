/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\topX1.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger topX1 on Top_X_Destination__c (after insert) {
   set<id> ides = new set<id>(); 
    for(Top_X_Destination__c top:trigger.new){
        if(top.Type__c == 'Contract Flow Down/Handoff' && top.Document_Attached__c== true){
           ides.add(top.Opportunity__c); 
        }
    }
    list<opportunity> opplist = [select id,name,Handoff_Attached__c from Opportunity where id IN:ides];
    for(opportunity opp1:opplist){
        opp1.Handoff_Attached__c='yes';
    }
    update opplist;
}