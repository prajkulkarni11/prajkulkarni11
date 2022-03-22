/**
 * @File Name          : ContactTrigger.trigger
 * @Description        :  Trigger Assignment 22.Create a checkbox on contact object and Write a trigger to check that checkbox whenever a new contact is created.


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 19-03-22, 1:30:39 pm
* @Modification Log   : 
 **/

trigger ContactTrigger on Contact (before update,before insert) {
    
    
    List<Contact> conlist=new List<Contact>();
    if(HandlerContactTrigger.isFirst){
        
        HandlerContactTrigger.isFirst=False;
  
        for(contact c:trigger.new)
    {
        if(c.Email!=null)
        {
            c.HasEmailAddress__c = true;
            conlist.add(c);
        }
        else{
            c.HasEmailAddress__c=false;
            conlist.add(c);
        }
    }
   
  }
}