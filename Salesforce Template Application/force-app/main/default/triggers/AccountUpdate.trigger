/**
* @description       : On Account and Opportunity object there is city field and whenever i update the account city field with new value then atomatically change assosiated opportunity city field get updated
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger AccountUpdate on Account (after update) {    
    if(trigger.isUpdate){
        AccountUpdateHelper.updateOppCity(trigger.new,trigger.oldmap);
    }   
}