/**
* @description       :  Write a trigger to check duplicate email on employee object

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger CheckDuplicateEmail On Employee__c (Before Insert) {
     if(trigger.isBefore){
       CheckDuplicateEmailHelper.duplicateEmailValidation(trigger.new);
    } 
   
}