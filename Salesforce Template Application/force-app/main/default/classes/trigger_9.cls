/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\trigger_9.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Tuesday, March 22nd 2022, 10:13:45 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public class trigger_9 {
 
    public static void assign9(list<contact> conlist, list<contact> conlist1, boolean avi){
             List<Contact> contactlist = new List<Contact>();
        Set<id> accountIdSet = new Set<id>();
        if(avi){
            contactList = conlist1;
        }else{
           contactList = conlist; 
        }
        
        for(Contact con: contactlist){
            if(con.AccountId != null){
                accountIdSet.add(con.accountId);
            }
        }
         List<Account> acc = [select id, Count_of_Contacts__c,(select id from contacts) from account where id in :accountIdSet];
        for(Account a : acc){
            List<Contact> relatedContacts = a.Contacts;
            if(relatedContacts!=null){
                a.Count_of_Contacts__c = relatedContacts.size();
            }else{
                a.Count_of_Contacts__c = 0;
            }
        }
        update acc;
    }
}