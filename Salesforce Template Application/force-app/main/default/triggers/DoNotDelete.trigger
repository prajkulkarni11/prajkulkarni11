/* *
 * @ClassName : DoNotDelete
 * @Description : Dont let to delete if related to contact
 * @author : Girish
*/
trigger DoNotDelete on Account (before delete)  
{  
    List<Account> accList = new List<Account>();  
    Set<id> accIdSet = new Set<id>();  
    for(Account acc : Trigger.old)  
    {  
        accIdSet.add(acc.id);  
    }  

    Map<Id, Account> accts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accIdSet]);

    for(Account acc : Trigger.old)
    {
        if(accts.get(acc.id).contacts.size()>0)
        {
            acc.adderror('Account cannot be deleted');
            }
        }                                       

}