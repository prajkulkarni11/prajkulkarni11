/**
 * @File Name          : SendEmailToNewContact.trigger
 * @Description        : 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 09/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
trigger SendEmailToNewContact on Contact (After insert) {

    if(Trigger.IsAfter){
        SendEmailToNewContactHelper.sendEmailToContact(Trigger.new);
    }
}