/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\updateIndustry.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:26 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger updateIndustry on Account (before insert) {

    for(account acc:trigger.new){
        if(acc.importing__c==false){
            if(acc.Industry == null){
        acc.Industry ='Banking';
        }
        }
    }
}