/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\updateCity.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:13 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class updateCity {

    public static void updateCit(list<Account> acclist){
        list<contact> conlist = new list<contact>();
        set<id> ides = new set<id>();
        
        for(Account acc: acclist){
            ides.add(acc.id);
        }
        
        conlist = [select id, name,accountid, accCity__c from contact where accountid in: ides];
        for(account acc1:acclist){
            for(contact ce: conlist){
                ce.accCity__c =acc1.City__c;
            }
        }
            system.debug(conlist);
           
         update conlist;
}
}