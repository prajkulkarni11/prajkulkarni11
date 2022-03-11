/**
* @description       : On Account and Opportunity object there is city field and whenever i update the account city field with new value then atomatically change assosiated opportunity city field get updated
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class AccountUpdateHelper {
    
    public static void updateOppCity(List<Account>newAccList,map<id,Account>oldmapAcc){
        try{
            set<id>setAccIds=new set<id>();
            for(account acc:newAccList)
            {
                if(acc.City__c != oldmapAcc.get(acc.id).City__c)
                {
                    setAccIds.add(acc.id);
                }
            }
            List<opportunity> oppList=[select id, City__c,Accountid,Account.City__c from Opportunity where accountid in:setAccIds];
            List<opportunity>updateOppourtunityList = new List<opportunity>();
            if(!oppList.isEmpty())
            {
                for(opportunity opp:oppList)
                {
                    opp.city__c=opp.Account.City__c;
                    updateOppourtunityList.add(opp);
                }
            }
            if(updateOppourtunityList.size()>0){
                update updateOppourtunityList; 
            }
            
        }catch(Exception e){
            
        }
        
    }
}