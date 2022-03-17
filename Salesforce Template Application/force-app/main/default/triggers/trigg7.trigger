/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigg7.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigg7 on Account (before insert, before update) {
    if(trigger.isBefore){
        user u = [select id, Name from user where id =:trigger.New[0].OwnerId];
  for(Account Acc : trigger.New)
  { 
      Acc.Sales_Rep__c = u.Name;
   }
}
}