public with sharing class FetchContacts {
    public FetchContacts() {

    }
    public static List<Contact> searchForAcc(){ 
        
        List<Contact> acc = [SELECT Id, Name FROM Contact WHERE AccountId IN(SELECT ID FROM Account)];
        
        system.debug(+acc);
        return acc;
    }
}