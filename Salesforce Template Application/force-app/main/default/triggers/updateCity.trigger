/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\updateCity.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger updateCity on Account (after update) {

    updateCity.updateCit(trigger.New);
}