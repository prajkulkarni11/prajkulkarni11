/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\Assignment_23.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:55 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger Assignment_23 on Account (after insert) {

    if(trigger.isAfter){
        if(trigger.isInsert){
            Assignment_23_handler.assign23(trigger.new);
        }
    }
}