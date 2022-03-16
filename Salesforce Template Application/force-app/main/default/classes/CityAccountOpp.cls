/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:10
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:08:38
 * @ Description:1.	On Account and Opportunity object there is city field and whenever i update
  the account city field with new value then atomatically change assosiated opportunity city field get updated
 */


public with sharing class CityAccountOpp {
 public static void getvalue(list<account>acc, Map<Id,Account> oldmap){
        
   Opportunity[] OppListToUpdate = new Opportunity[]{};
          map<id,account> Accmap=new map<id,account>();
          for(Account a:acc)
          {
           		if(oldmap!=null && a.AccountCity__c !=oldmap.get(a.id).AccountCity__c)
                {
           			 Accmap.put(a.id,a);
    			}
          }
    if(!Accmap.isEmpty()){
        Set<id> AccIDs=Accmap.keyset();
        list<Opportunity> Opplist=[Select id, AccountId,city__c from Opportunity where Id in :AccIDs];
        
        if(Opplist.size()>0){
            for(Opportunity o: Opplist )
            {
                if(Accmap.containsKey(o.AccountId))
                {
                o.city__c=Accmap.get(o.accountId).Accountcity__c;
                OppListToUpdate.add(o);
                }
            }
        }
    }
    
    if(OppListToUpdate.size()>0){
        update OppListToUpdate;
    }
    }
}