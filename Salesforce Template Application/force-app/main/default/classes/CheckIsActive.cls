public class CheckIsActive {
public static void check(list<Account> acclist)
{
    list<Account> acc =new list<Account>();
    For(Account a:acclist)
    {
        if(a.Active__c=='Yes')
        {
            a.addError('Account is Active you can not delete ' );
        }
    }
}
}