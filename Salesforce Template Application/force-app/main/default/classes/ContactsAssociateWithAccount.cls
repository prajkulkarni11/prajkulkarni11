/**
 * @File Name          : ContactsAssociateWithAccount.cls
 * @Description        :  display all contacts which are associated with accounts
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class ContactsAssociateWithAccount {
    
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