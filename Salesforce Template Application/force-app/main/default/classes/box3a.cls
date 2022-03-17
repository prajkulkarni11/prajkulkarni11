/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\box3a.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:08:59 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class box3a implements Queueable  {
   id emp;
   Account acc;
    global box3a(id eid){
        emp = eid;
    }
     global void execute(QueueableContext qc){
        acc =  [Select id, Name, CreatedDate from Account where id=:emp];
         id accid = system.enqueueJob(new box3b(acc));
         delete acc;
     }  
}