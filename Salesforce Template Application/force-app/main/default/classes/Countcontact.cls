public class Countcontact {
  public static boolean flag = false;
public static void addcountcon(list <Contact> conlist)
{
     
    for(Contact c:conlist)
    { flag = true;
        for(Account ac:[select Name,Count_of_Contacts__c from Account where id =:c.Accountid])
        {
           ac.Count_of_Contacts__c= ac.Count_of_Contacts__c+1;
        }
    }
     flag = false;
}
  public static void subcountcon(list <Contact> conlist)
  {
    for(Contact c:conlist)
    {flag = true;
        for(Account ac:[select Name,Count_of_Contacts__c from Account where id =:c.Accountid])
        {
           ac.Count_of_Contacts__c= ac.Count_of_Contacts__c-1;
        }
    }
     flag = false; 
  }
}