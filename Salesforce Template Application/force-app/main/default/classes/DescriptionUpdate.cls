/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:10
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:07:02
 * @ Description:2.	There is a description field on Account and also on Contact. 
 Whenever the account description is updated, the related Contact description should also be updated but 
 I should be able to identify from the description which account this contact is related to.
 */


public with sharing class DescriptionUpdate
{    
public static void accountUpdate(List<Account>aclist,map<id,account> oldmap)
{
    set<id> accountId=new set<id>();
    for(Account ac:aclist)
    {
        account accountOld=oldmap.get(ac.id);
        if(ac.Description__c!=accountOld.Description__c)
        {
            accountId.add(ac.Id);
        }
    }

    if(accountId.size()>0)
    {
        //to fetch the related contact with that account  by using the old map ids
        map<id,account> accountmap=new map<id,account>([select id,Name,Description__c,(select id,Description__c from contacts) from account where id in:accountId]);
        List<contact> clist=new List<contact>();
        for(account ac:aclist){
            account accountOld=oldmap.get(ac.id);
            if(ac.Description__c!=accountOld.Description__c){
                if(accountmap.containskey(ac.id)){
                    account ac1=accountmap.get(ac.id);
                    List<contact>lstCont = ac1.contacts;
                    for(contact c:lstCont){
                        c.Description__c=ac.Description__c;
                        clist.add(c);
                    }

                }
            }
        }
        if(!clist.isEmpty()){
            update clist;
        }

    }
}
}