/**

 * @File Name          : AccountDuplicate.cls
 * @Description        :  Trigger Assignment 02:Write a Triger to Prevent the users to create Duplicate Accounts
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 15-03-22, 3:40:39 pm
* @Modification Log   : 

 **/

trigger AccountDuplicate on Account (before insert) {
    
    List<Account> duplicateAcc = new List<Account>();
    
    duplicateAcc = [Select id, Name from Account];
    
    for(Account a:Trigger.New){
        
        for(Account acc:duplicateAcc){
            if(acc.Name==acc.Name){
                acc.Name.addError('Name already Exist ');
            }
        }
    }   
}