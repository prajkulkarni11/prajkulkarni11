
/**
 * @File Name          : OppTrigger
 * @Description        : 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 28/02/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/

trigger OppTrigger on Account (after update) {

    Map <  Id,  Account > mapAccount = new Map < Id, Account >();
    List < Opportunity > listOpportunity = new List< Opportunity >();
  
    for ( Account acct : trigger.new ) {
       
        if ( acct.Name != trigger.oldMap.get( acct.Id ).Name ||
             acct.Type != trigger.oldMap.get( acct.Id ).Type )
            mapAccount.put( acct.Id, acct );
 
    }
   
    if ( mapAccount.size() > 0 ) {


        listOpportunity = [ SELECT Description, AccountId FROM Opportunity WHERE AccountId IN : mapAccount.keySet() ];
      
        if  ( listOpportunity.size() > 0  )  {

            for  (  Opportunity opp : listOpportunity  )  {


                opp.Description =(opp.Description + mapAccount.get( opp.AccountId ).Name);

            }
            update listOpportunity;

        }
   
    }

}