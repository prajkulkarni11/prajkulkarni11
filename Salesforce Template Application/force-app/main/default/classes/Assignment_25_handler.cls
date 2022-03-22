/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_25_handler.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:51 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class Assignment_25_handler {

    public static void assign25(list<contact> conlist,map<id,Contact> mapconlist){
        For (Contact con : conlist){
        if(mapconlist.get(con.Id).Status__c == 'New' && con.Status__c == 'Closed'){
            con.addError('Go in process');
        }
    }
    }
}