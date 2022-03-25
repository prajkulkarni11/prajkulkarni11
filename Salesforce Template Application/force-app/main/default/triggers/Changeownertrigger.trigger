/**
 * @File Name          : Changeownertrigger.js
 * @Description        : apex trigger assignment:-34.Write a trigger to update the related contacts owner if the account owner gets changed and mention the owner history details on account level.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 24/03/2022, 11:09:39 pm
 * @Modification Log   : 
 
**/

trigger Changeownertrigger on Account (after update) {
       
          Set<Id> accountIds = new Set<Id>();
          Map<Id, String> oldOwnerIds = new Map<Id, String>();
          Map<Id, String> newOwnerIds = new Map<Id, String>();
          Contact[] contactUpdates = new Contact[0];
          
          for (Account a : Trigger.new)
          {
             if (a.OwnerId != Trigger.oldMap.get(a.Id).OwnerId)
             {
                oldOwnerIds.put(a.Id, Trigger.oldMap.get(a.Id).OwnerId);
                newOwnerIds.put(a.Id, a.OwnerId);
                accountIds.add(a.Id);
             }

          }
            if (!accountIds.isEmpty()) {
             for (Account acc : [SELECT Id, (SELECT Id, OwnerId FROM Contacts) FROM Account WHERE Id in :accountIds])
                {
                String newOwnerId = newOwnerIds.get(acc.Id);
                String oldOwnerId = oldOwnerIds.get(acc.Id);
                for (Contact c : acc.Contacts)
                {
                   if (c.OwnerId == oldOwnerId) 
                   {
                   Contact updatedContact = new Contact(OwnerId = newOwnerId, Id = c.Id);
                   contactUpdates.add(updatedContact);
                   }
                }
                 
                }
           }
                update contactUpdates;
    }