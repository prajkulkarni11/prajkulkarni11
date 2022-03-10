/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:42:07
 * @ Description:display all accounts which have null contacts associated with them.(AccountWithNoContact)
 */

public with sharing class AccountWithNoContact {
    public AccountWithNoContact() {

    }
    public static List<Account> searchForAcc(){ 
        
        List<Account> acc = [Select Id,name from Account where Id not In (select AccountId from Contact) ];
        
        system.debug(+acc);
        return acc;
    }
}