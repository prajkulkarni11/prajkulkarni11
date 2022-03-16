/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\trigger_4_controller.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:09:01 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class trigger_4_controller {

    public static void bookPrice(list<book__c> books){
        for(book__c bc: books){
                if(bc.Price__c!=null){
                    bc.Price__c = 0.9*(bc.Price__c);
                }
        }
    }
}