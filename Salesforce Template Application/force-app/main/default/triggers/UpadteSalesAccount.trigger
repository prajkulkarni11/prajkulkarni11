/**
 * @File Name          : UpadteSalesAccount.cls
 * @Description        :  Trigger Assignment 07:Create “Sales Rep” field with data type (Text) on the Account Object. When we create the Account record, the Account Owner will be automatically added to Sales Rep field. When we update the Account owner of the record, then also the Sales Rep will be automatically updated.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 16-03-22, 4:40:39 pm
* @Modification Log   : 
 **/

trigger UpadteSalesAccount on Account (Before insert,Before Update){
    
    set<Id> setAccowner = new set<Id>();
    for(Account Acc : trigger.New)
    { 
        setAccowner.add(Acc.ownerId);
    }
    
    Map<Id, user> usermap = new Map<Id, user>([SELECT Name FROM  user WHERE Id IN: setAccowner]);
    for(Account Acc : Trigger.New)
    {
        user usr = usermap.get(Acc.ownerId);
        Acc.sales_rep__c = usr.Name;
    }
}