public with sharing class AccountWithNoContact {
    public AccountWithNoContact() {

    }
    public static List<Account> searchForAcc(){ 
        
        List<Account> acc = [Select Id,name from Account where Id not In (select AccountId from Contact) ];
        
        system.debug(+acc);
        return acc;
    }
}