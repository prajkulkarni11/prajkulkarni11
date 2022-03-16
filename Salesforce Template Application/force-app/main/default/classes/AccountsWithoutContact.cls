/**
 * @File Name          : AccountsWithoutContact.cls
 * @Description        : Display all accounts which have null contacts associated with them
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class AccountsWithoutContact {
    
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