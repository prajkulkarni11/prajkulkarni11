

/**

 * @File Name          : AccountsWithoutContacts.cls
 * @Description        : soql & sosl Assignment 03: display all accounts which have null contacts associated with them
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 1:40:39 pm
* @Modification Log   : 

 **/


public with sharing class AccountsWithoutContacts {

    public static void displayAccountsWithoutContacts(){
        try{
            List<Account> results = [select name from account where id not in (select accountid from contact)];

            System.debug('No contacts account list:'+results);
        }

        catch(Exception e)
        {
            System.debug('Exception:-'+e.getMessage());
        }
    }
}