/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-08 14:32:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:50:43
 * @ Description:display  all contact associated with account
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