/**
 * @File Name          : CreateAccountContact.cls
 * @Description        :  Trigger Assignment 18.Write code for following: After an Account record is created, create a Contact record linked to that Account record. [Restriction: Cannot use apex trigger for this]
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 22-03-22, 2:30:39 pm
* @Modification Log   : 
**/


public with sharing class CreateAccountContact {
    
    @InvocableMethod (label='Create Contacts')
  public Static void createContact(List<Account> accList){ 
      List<Contact> conListToInsert = new List<Contact>(); 
      //loop through the accounts and create contacts
      for(Account acc : accList){
          if(acc.Number_of_Contacts__c != null){
              for(integer i=1;i<=acc.Number_of_Contacts__c;i++){
                  Contact con = new Contact();
                  con.LastName = 'Invocable ' + acc.Name +' ' + i;
                  con.AccountId = acc.Id;
                  conListToInsert.add(con);
              }
          }
      }
      if(!conListToInsert.isEmpty()) {
          insert conListToInsert; }
  }
}