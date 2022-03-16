/**
* @description       : There is a description field on Account and also on Contact. Whenever the account description is updated, the related Contact description should also be updated but I should be able to identify from the description which account this contact is related to. 
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class AccountUpdateDescriptionHelper {
    public static void updateconDesc(List<Account>newAccList,map<id,Account>oldmapAcc){
        Set<id> accountIds = new Set<id>();
        for(Account a:newAccList)
        {
            if(a.description != oldmapAcc.get(a.id).description)
            {
                accountIds.add(a.id);
            }
        }
        List<contact> conlist=[select id, description,Accountid,Account.Name,Account.description from contact where accountid in: accountids];
        list<contact> updateconlist = new  list<contact> ();
        for(contact c:conlist)
        {
            c.description = c.Account.description+'  : This description is from this Account : --->*'+c.Account.name;
            updateconlist.add(c);
        }
        update updateconlist;
    }
}