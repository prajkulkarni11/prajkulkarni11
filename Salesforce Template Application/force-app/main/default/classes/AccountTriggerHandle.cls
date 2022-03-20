/**
 * @File Name          : AccountTriggerHandle.cls
 * @Description        :  Trigger Assignment 23.Write a trigger to create related contact when an Account is created and associate that contact with that account.


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 2:30:39 pm
* @Modification Log   : 
 **/

public with sharing class AccountTriggerHandle {
    
    public static void createContact(List<Account> accounts) {
        
        List<Contact> contact = new List<Contact>();
        
        for(Account a : accounts){
            
            Contact c = new Contact(LastName = a.name,
                        AccountId=a.id,
                        MailingStreet=a.BillingStreet,
                        MailingCity=a.BillingCity,
                        MailingState=a.BillingState,
                        MailingPostalCode=a.BillingPostalCode,
                        MailingCountry=a.BillingCountry,
                        Fax=a.Fax);
            contact.add(c);
        }
        
        insert contact; 
    }

}