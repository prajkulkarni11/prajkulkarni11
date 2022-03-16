/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:41:29
 * @ Description:display all contacts which are associated with accounts(FetchContacts)
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