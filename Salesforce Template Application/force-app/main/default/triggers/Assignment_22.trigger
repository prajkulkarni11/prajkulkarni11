/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\Assignment_22.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:55 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger Assignment_22 on Contact (before insert) {

    if(trigger.isBefore){
        if(trigger.isInsert){
            Assignment_22_handler.Assign22(trigger.New);
        }
    }
}