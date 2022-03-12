/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:43:56
 * @ Description: display all accounts which have null contacts associated with them.(AccountWithNoContact)

 20m 20s
 7m 6s
 40m 1s
 14m 4s

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