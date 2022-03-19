public class UpdateSalesRep {
public static void updatesaleRep(list<Account> Acclist)
{
     Set<Id>setAccOwner=new Set<Id>();
    for(Account Acc : acclist)
  { 
   setAccowner.add(Acc.ownerId);
   }

    Map<Id, user> usermap = new Map<Id, user>([SELECT Name FROM user WHERE Id IN: setAccowner]);
 for(Account Acc : acclist)
 {
   user usr = usermap.get(Acc.ownerId);
   Acc.sales_rep__c = usr.Name;
    }
}
}