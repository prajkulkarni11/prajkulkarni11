/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-08 14:32:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:46:09
 * @ Description: display the account without having contact
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