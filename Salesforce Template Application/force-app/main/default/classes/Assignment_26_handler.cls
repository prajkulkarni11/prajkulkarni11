/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_26_handler.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:51 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class Assignment_26_handler {

    public static void assign26(list<A__c> alist){
        list<C__c> clist = [select id,name,A__c, A__r.status__c, B__r.status__c from C__c where A__c in:alist];
        for(A__c ae:alist){
             for(C__c ce:clist){
            ce.B__r.status__c = ae.Status__c;
        }
        }
        update clist;
    }
}