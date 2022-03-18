
/**
 * @File Name          : CountOfContacts.Trigger
 * @Description        :  Trigger Assignment 09: Create field called “Count of Contacts” on Account Object. When we add the Contacts for that Account then count will populate in the field on Account details page. When we delete the Contacts for that Account, then Count will update automatically.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 3:50:39 pm
* @Modification Log   : 
 **/

trigger CountOfContacts on Contact (after insert,after delete) {
    set<id> accid=new set<id>();
    list<contact> contactlist =new list<contact>();
    list<contact> listcon=new list<contact>();
    list<account> acclist=new list<account>();
    list<account> listAcc=new list<account>();
    map<id,integer> mapCount=new map<id,integer>();
    if(trigger.isinsert){
        for(contact con:trigger.new){
            accid.add(con.accountid);
        }
    }
    if(trigger.isdelete){
        for(contact con:trigger.old){
            accid.add(con.accountid);
        }
    }
    acclist=[select id,name from account where id in:accid];
    contactlist = [select id,name,accountid from contact where accountid in:accid];
    for(account acc:acclist){
        listcon.clear();
        for(contact c:contactlist){
            if(c.accountid==acc.id){
                listcon.add(c);
                mapCount.put(c.accountid,listcon.size());
            }
        }
    }
    if(acclist.size()>0){
        for(Account a:acclist){
            if(mapCount.get(a.id)==null)
                a.CountOfContacts__c=0;
            else
                a.CountOfContacts__c=mapCount.get(a.id);
            listAcc.add(a);
        }
    }
    if(listAcc.size()>0)
        update listAcc;
}