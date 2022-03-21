/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_23_Handler.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:53 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class Assignment_23_Handler {

    public static void assign23(list<account> acclist){
        for(account acc:acclist){
            Contact c1 = new contact();
            c1.AccountId = acc.Id;
            c1.LastName = acc.Name;
            c1.FirstName = 'Test';
        }
    }
}