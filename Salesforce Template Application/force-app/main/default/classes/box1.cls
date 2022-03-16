/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\box1.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:08:58 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class box1 implements Messaging.InboundEmailHandler{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new messaging.InboundEmailResult();
        try{
         
            String str = email.fromAddress;
            Account a = new Account();
            a.Name = 'Acme Industries';
            a.Type = 'Prospect';
            a.Phone = '(212) 555-5555';
            a.NumberOfEmployees = 680;
            a.Description = email.plainTextBody;
            insert a;
            result.success=true;
            
        }catch(exception e){
            result.success = false;
            
        }
        return result;
    }
}