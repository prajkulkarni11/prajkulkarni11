public with sharing class FetchAccountRecords {
    public FetchAccountRecords() {

    }
    public static List<Account> searchForAcc(){ 
        
        List<Account> acc = [select id, name, (select id, name from Opportunities),(select id, name from Contacts) from Account where name='Aishwarya'];
        
        system.debug(+acc);
        return acc;
    }
}