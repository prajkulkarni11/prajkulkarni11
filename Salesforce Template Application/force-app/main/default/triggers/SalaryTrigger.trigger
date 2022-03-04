
/**
 * @File Name          : MassEmailMessage.cls
 * @Description        : Apex Assignment-send an email to customer when new salary record is created
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 04/03/2022, 4:40:39 pm
 * @Modification Log   : 
 
**/

trigger SalaryTrigger on Salary__c (before insert) {
    
    
    for(Salary__c sal : Trigger.new){ 
        sal.isNew__c = true;
    }
    
}