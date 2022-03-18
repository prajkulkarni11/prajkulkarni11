/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigg3.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigg3 on Opportunity (before insert, before update) {
    
for(Opportunity opp: trigger.new){

user u = [select id, name from user where id=:opp.Ownerid];
opp.Sales_team__c = u.Name;
}
}