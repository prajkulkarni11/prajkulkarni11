/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assign_21.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Tuesday, March 22nd 2022, 10:13:45 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

@isTest
public class Assign_21 {

    @isTest
    public static void toll1(){
        List<Complaint__c> comp = new list<Complaint__c>();
       
        for(integer i = 0; i<50;i++){
            Complaint__c ab = new Complaint__c(Name = 'name'+i, Priority__c ='Low');
            comp.add(ab);
        }
        for(integer i = 50; i<100;i++){
            Complaint__c ab = new Complaint__c(Name = 'name'+i, Priority__c ='Medium');
            comp.add(ab);
        }
        for(integer i = 100; i<150;i++){
            Complaint__c ab = new Complaint__c(Name = 'name'+i, Priority__c ='High');
            comp.add(ab);
        }
         for(integer i = 150; i<200;i++){
            Complaint__c ab = new Complaint__c(Name = 'name'+i, Priority__c ='Critical');
            comp.add(ab);
        }

        insert comp;
        
        box6 b = new box6();
        database.executeBatch(b);
        
    }
}