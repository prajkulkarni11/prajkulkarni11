/**
 * @File Name          : AccountUpdate.cls
 * @Description        :  Trigger Assignment 28.Create a TotalAmount field on account object, and need to sum of the opportunity amount for all the opportunity which is closed won for that account, use batch class.


 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 21-03-22, 1:30:39 pm
* @Modification Log   : 
 **/

global with sharing class AccountUpdate implements Database.Batchable<sObject>,Database.stateful{
    public Database.QueryLocator start(Database.BatchableContext context) {
        String queryString ='select id from Account';
        Database.QueryLocator locator = Database.getQueryLocator(queryString);
        return locator;
    }
    
    public void execute(Database.batchableContext context, List<Account> scope) {
        Map<Id, AggregateResult> results = new Map<Id, AggregateResult>([SELECT AccountId Id, SUM(Amount) amt FROM Opportunity WHERE StageName = 'Closed Won' AND AccountId = :scope GROUP BY AccountId ]);
        for(Account record : scope) {
            AggregateResult amount = results.get(record.Id);
            if(amount != null) {
                record.TotalAmount__c = (Decimal)amount.get('amt');
            } else {
                record.TotalAmount__c = null;
            }
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('Total Amount Calculated');
    }         
}