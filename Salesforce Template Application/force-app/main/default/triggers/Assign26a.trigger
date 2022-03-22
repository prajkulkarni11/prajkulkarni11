/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\Assign26a.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:55 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger Assign26a on A__c (after update) {

    Assignment_26_handler.assign26(trigger.new);
}