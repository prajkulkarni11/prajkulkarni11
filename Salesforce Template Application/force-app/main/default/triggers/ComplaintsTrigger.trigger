/**
 * @File Name          : ComplaintsTrigger.trigger
 * @Description        :  Trigger Assignment 20:Create custom object ‘Complaints’ with appropriate fields. It will have ‘Response Date’ field (Date/time). It will also have ‘Priority’ field (Picklist). Write a code which will auto-update Response Date field based on Priority using following mapping:	


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 12:30:39 pm
* @Modification Log   : 
 **/


trigger ComplaintsTrigger on Complaints__c (before Update,before insert) {
    
    Long interval1 = 2 * 86400000; 
    Long interval2 = 5 * 86400000;
    Long interval3 = 10 * 86400000;
    
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        for(Complaints__c c:trigger.new){
            if(c.Priority__c == 'Critical'){
                c.Response_Date__c = c.CreatedDate.AddHours(6);
            }
            else if(c.Priority__c == 'High'){
                c.Response_Date__c = BusinessHours.addGmt(bh.ID, c.CreatedDate, interval1);
            }
            else if(c.Priority__c == 'Medium'){
                c.Response_Date__c = BusinessHours.addGmt(bh.ID, c.CreatedDate, interval2);
            }
            else if(c.Priority__c == 'Low'){
                c.Response_Date__c = BusinessHours.addGmt(bh.ID, c.CreatedDate, interval3);
            }
            
            
        }
        
    }
}