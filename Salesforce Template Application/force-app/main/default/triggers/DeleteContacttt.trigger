/**
 * @File Name          : DeleteContacttt.trigger
 * @Description        :  Trigger Assignment 24.Write a trigger to delete all the related contacts whenever associated account is deleted.


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 4:30:39 pm
* @Modification Log   : 
 **/


trigger DeleteContacttt on Contact (after delete) {
    
    List<ID> contactId = new List<ID>();
    
    if(Trigger.isDelete){
        for(Contact contactToDelete: Trigger.old) {
            contactId.add(contactToDelete.AccountId);
        }
        
        List<Account> DelAccount = [select id from Account where Id IN:contactId];
        
        delete DelAccount ;
        
    }
    
}