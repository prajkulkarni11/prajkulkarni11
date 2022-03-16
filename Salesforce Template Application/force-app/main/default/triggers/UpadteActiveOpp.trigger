/**
 * @File Name          : UpadteActiveOpp.cls
 * @Description        :  Trigger Assignment 06:Create the object called “Customer Project” and create Status field under this object with picklist data type (Values=Active, Inactive). Create the relationship between this custom object and Opportunity so that Customer Project is related list to the Opportunity.
Create  Active Customer project field on Opportunity object (Data Type=Checkbox)
The logic is when we create Customer Project for an Opportunity with the Status=Active, then Active Customer project check box on the Opportunity Detail page is automatically checked.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 16-03-22, 3:40:39 pm
* @Modification Log   : 
 **/

trigger UpadteActiveOpp on Customer_Project__c (after insert)
{
    List<Opportunity> opp=new List<Opportunity>();
    for(Customer_Project__c cust:Trigger.New){
        if(cust.Values__c=='Active'){
            Opportunity oppo= new Opportunity(id=cust.Opportunity__c);
            oppo.Active_Customer_Project__c = True;
            opp.add(oppo);
        }
    }
    update opp;
}