/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignmnet_30.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:48 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

global class Assignmnet_30 implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelop)
{
Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
String accname = email.subject;
String accdes = email.plainTextBody;
String accIndus = email.fromName;
Lead le = new Lead( LastName = accname, Status = accdes, Company = accIndus);
insert le;
return null;
	}
}