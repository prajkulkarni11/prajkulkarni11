
/**
 * @File Name          : ContactRelationship.cls
 * @Description        :  Trigger Assignment 08:Create the field called “Contact Relationship” checkbox on the Contact Object and Create the related object called “Contact Relationship” which is related list to the Contacts.(Look Up Relationship).
Now logic is when we create contact by checking Contact Relationship checkbox, then Contact Relationship will be created automatically for that contact.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 16-03-22, 2:40:39 pm
* @Modification Log   : 
 **/



trigger ContactRelationship on Contact (after insert)
{
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            ContactRelation ConRel = New ContactRelation();
            ConRel.createContactRelationship(trigger.new);
        }
    }
}