/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigg4.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:26 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigg4 on Book__c (before insert, before update ) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate || Trigger.isInsert){
            for(Book__c c:Trigger.New){
                if(c.Price__c!=null){
                    c.Price__c = 0.9*(c.Price__c);
                }
            }
        }
        
    }
}