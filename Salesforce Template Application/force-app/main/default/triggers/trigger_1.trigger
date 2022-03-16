/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigger_1.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:09:02 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigger_1 on Account (before insert) {

    trigger_1_controller.trigger1(trigger.new);
}