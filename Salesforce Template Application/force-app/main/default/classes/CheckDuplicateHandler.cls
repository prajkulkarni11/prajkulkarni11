public class CheckDuplicateHandler {
    public static void check(list<account>alist)
    {
        For(Account a:alist)
        {
            list<Account> acc= [select id,Name from Account where Name =:a.Name];
            if(acc.size()>0)
            {
            a.addError('record exist');
            }
        }
    }

}