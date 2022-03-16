/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\box3b.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:08:59 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class box3b implements system.Queueable {
   
    Account acc1;
    global box3b(Account acc){
        acc1= acc;
    }
    global void execute(system.QueueableContext qc){
        Accounts_Delete_Log__c log1 = new Accounts_Delete_Log__c();
        log1.Name = acc1.Name;
        log1.Account_Deleted_Date__c = dateTime.now().date();
        log1.Account_Deleted_Time__c = dateTime.now().time();
        insert log1;
        system.debug(log1.Id);
    }
}