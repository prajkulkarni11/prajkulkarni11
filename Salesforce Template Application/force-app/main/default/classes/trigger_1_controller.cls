/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\trigger_1_controller.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:09:00 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public class trigger_1_controller {

    public static void trigger1(list<account> acclist){
        list<account> accli =[select id, name from account];
        for(account acc: acclist){
            for(account acc1: accli){
                if( acc1.name== acc.name){
                    acc.addError('duplicate account name');
                }            
        }
    } 
}
}