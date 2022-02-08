// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);
LogUtility.logMessage('Hi there');
 


Boolean value = TriggerSetting.isTriggerActive('AccountHANDLER');
LogUtility.logMessage('Account handler :'+value);
	
String objectName = SObjectUtility.getObjectNameFromLabel('Log Message Event');
LogUtility.logMessage('Object Name Found  :'+objectName);


String inputRecord = '{"rowNumber":"1" ,"objectName" :"Contact" ,"objectData" :[ {"fieldName":"First Name" ,"fieldValue":"Yogesh"} ,{"fieldName":"Last Name" ,"fieldValue":"Bhosale" }]  }';
SObject objectSo =  SObjectUtility.createSObject(inputRecord);LWC COMPONET