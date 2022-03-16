public class PreventDeleteAcc {
    public static void checkContact(list<Account>acclist)
    {
         Integer count = 0;
        
        for(Account acc : accList)
        {
            count = [Select Count() from contact where accountId = :acc.Id];
            if(count > 0)
            {
                acc.addError('Account cannot be deleted');
            }
        }
        
    }

}