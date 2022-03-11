/**
* @description       : There is a description field on Account and also on Contact. Whenever the account description is updated, the related Contact description should also be updated but I should be able to identify from the description which account this contact is related to. 
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger AccountUpdateDescription on Account (After Update) {
    if(trigger.isUpdate){
        AccountUpdateDescriptionHelper.updateconDesc(trigger.new,trigger.oldmap);
    }  
   
}