/**
 * @File Name          : SendEmailToCustomer.trigger
 * @Description        : 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 09/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
trigger SendEmailToCustomer on Salary__c (After insert) {

    if(Trigger.IsAfter){
        SendEmailToCustomerHelper.getCustomerData(Trigger.new);
    }
  
}