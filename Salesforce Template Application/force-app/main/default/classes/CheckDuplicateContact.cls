public class CheckDuplicateContact {

    public static void check(list<Contact> conlist)
    {
     
        for(Contact c:conlist)
        {
           integer count=[select count() from Contact where LastName =:c.LastName];
            if(Count>0)
            {
                c.addError('Contact already exist');
            }
        }
        
        
}
}