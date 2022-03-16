/**

 * @File Name          : GetAccountNotContact.cls
 * @Description        :  SOQL Assignment 03:display all accounts who are not associated with any contact
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 5:40:39 pm
* @Modification Log   : 

 **/

public with sharing class GetAccountNotContact {
    
    public static void  getAccount(){

        try{
            List<Account> Acco=[Select Id,name from Account where Id not In (select AccountId from Contact) ];

            for(Account acc:Acco){
                system.debug('List:-'+acc);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }

}