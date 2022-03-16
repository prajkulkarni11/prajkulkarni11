public class BeforeDeleteEx {
public static void checkActive(list<Account> aclist)
{
    set <id> ids = new set<id>();
    for(Account a:aclist)
    {
        ids.add(a.id);
    }
    list<Account> acc = new list<Account>();
    list <Account> acctodel =[select id,Name,isActive__c from Account where Id IN:ids];
    for(Account ac:acctodel)
    {
        if(ac.isActive__c== true)
        {
            ac.addError('Account is active you cannot delete this account');
        }
    }
}
}