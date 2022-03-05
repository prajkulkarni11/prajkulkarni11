

/**

 * @File Name          : ContactsAssociateAccount.cls
 * @Description        : soql & sosl Assignment 02: display all contacts which are associated with accounts
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 2:40:39 pm
* @Modification Log   : 

 **/

public with sharing class ContactsAssociateAccount {
    public static void displayContactsAssociateWithAccount(){
        try{
            List<Contact>accountWithContact=[select Name,Account.Name from Contact limit 5];
            for(Contact acc:accountWithContact)
            {
                System.debug('Account With Associate Cotacts'+acc);
            }
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }

}