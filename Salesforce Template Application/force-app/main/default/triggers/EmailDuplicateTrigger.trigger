/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:01:31
 * @ Description: 4.	Write a trigger to check duplicate email on employee object
 */


trigger EmailDuplicateTrigger on Employee__c (before insert) {
  list<string> emaillist=new list<string>();
    for(Employee__c employees:trigger.new)
    {
        emaillist.add(employees.email__c);
    }
    list<Employee__c> listOfDuplicateemails=[select id,name,email__c from Employee__c where email__c in :emaillist];
    for(Employee__c emp:trigger.new)
    {
        if(trigger.isInsert){
        if(listOfDuplicateemails.size()!=0)
        {
            emp.addError('On employee Account this email is already exist');
        }
        }
        if(trigger.isUpdate)
        {
           for(Employee__c oldacc :trigger.old)
           {
               if(emp.email__c !=oldacc.email__c && listOfDuplicateemails.size()!=0)
               {
                   emp.addError('On employee Account this email is already exist');
               }
           }
        }
    }
}