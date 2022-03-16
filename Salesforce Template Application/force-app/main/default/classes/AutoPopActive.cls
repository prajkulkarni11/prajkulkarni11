public class AutoPopActive {
    public static void checkActive(list<Account> acclist)
    {
          for(Account acc:acclist)
       {
           if(acc.Active__c=='' || acc.Active__c==null)  
               acc.Active__c='Yes';
           
       }
         
    }
    }