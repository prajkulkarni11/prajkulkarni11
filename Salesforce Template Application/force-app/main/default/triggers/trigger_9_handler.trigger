/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigger_9_handler.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Tuesday, March 22nd 2022, 10:13:59 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigger_9_handler on Contact (before insert) {

    trigger_9.assign9(trigger.new,trigger.old,trigger.isDelete);
}