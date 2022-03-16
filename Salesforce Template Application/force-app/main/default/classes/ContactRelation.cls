/**
 * @File Name          : ContactRelation.cls
 * @Description        :  Trigger Assignment 08:Create the field called “Contact Relationship” checkbox on the Contact Object and Create the related object called “Contact Relationship” which is related list to the Contacts.(Look Up Relationship).
Now logic is when we create contact by checking Contact Relationship checkbox, then Contact Relationship will be created automatically for that contact.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 16-03-22, 2:40:39 pm
* @Modification Log   : 
 **/

public with sharing class ContactRelation {
    public void createContactRelationShip(List<contact> Con)
    {
        List<Contact_Relationship__c> conlist = new List<Contact_Relationship__c>(); 
        
        for(Contact newcon : Con)
        {
            if(newcon.Contact_Relationship__c == true)
            {
                Contact_Relationship__c CR = new Contact_Relationship__c();
                CR.Name = newcon.LastName;
                CR.Contact_Relationship__c = newCon.id;
                ConList.add(CR);
            }
        }
        insert ConList;
    }
}