public class CreateNumberOfCon {
public static void createcon(list<Account> Acclist)
{
    For(Account a:acclist)
    {
        decimal num =a.Number_Of_Contacts__c;
        for(integer count =1;count<=num;count++)
        {
            contact con = new contact();
            con.lastName='contact from Account'+count;
            insert con;
        }
    }
}
}