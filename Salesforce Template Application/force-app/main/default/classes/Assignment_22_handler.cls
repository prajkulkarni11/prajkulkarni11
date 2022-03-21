/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_22_handler.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:53 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public class Assignment_22_handler {

    public static void Assign22(list<Contact> conlist){
        for(contact con: conlist){
           con.Check__c = true;
        }
    }
}