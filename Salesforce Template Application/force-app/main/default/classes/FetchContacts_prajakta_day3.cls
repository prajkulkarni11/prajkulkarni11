/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:47:12
 * @ Description:Fetch the contact records which are associated with account
 */

public with sharing class FetchContacts {
    public FetchContacts() {

    }
    public static List<Contact> searchForAcc(){ 
        
        List<Contact> acc = [SELECT Id, Name FROM Contact WHERE AccountId IN(SELECT ID FROM Account)];
        
        system.debug(+acc);
        return acc;
    }
}