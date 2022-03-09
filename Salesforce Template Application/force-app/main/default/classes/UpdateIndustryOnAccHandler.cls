public class UpdateIndustryOnAccHandler {
public static void upadateAcc(list<Account>alist)
{
    List<Account> acct=new List<Account>();
    set<id> accid = new set<id>();
    for(Account a:alist)
    {
        accid.add(a.id);
    }
    list<Account> acc =[select id,name,Industry,AnnualRevenue from Account where Id IN:accid];
    for(Account ac:acc)
    {
        if(ac.AnnualRevenue==100000)
        {
            ac.Industry='Banking';
        }
        else if(ac.AnnualRevenue==200000)
        {
            ac.Industry='Finance';
        }
        else
        {
             ac.Industry='heathCare';
        }
        acct.add(ac);
    }
    update acct;
}
}