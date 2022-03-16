public class UpdateContactHandler {
    public static void updatecon(list<Account>alist)
    {
        set<id>updatedAcc = new set<id>();
        list<contact> clist = new list<contact>();
        for(Account ac:alist)
        {
           updatedAcc.add(ac.id); 
        }
            for(Account a :[select id,Name,description,(select id,lastname,description from Contacts)from Account where id IN:updatedAcc])
        {
            For(Contact c:a.contacts)
            {
                c.Description=a.Description;
                clist.add(c);
            }
        }
        update clist;
    }

}