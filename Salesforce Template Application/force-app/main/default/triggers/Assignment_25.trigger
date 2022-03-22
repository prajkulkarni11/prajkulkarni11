/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\Assignment_25.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:55 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger Assignment_25 on Contact (before update) {

    if(trigger.isBefore && trigger.isUpdate){
        Assignment_25_handler.assign25(trigger.new, trigger.oldMap);
    }
}