/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:51
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:30:57
 * @ Description:Write an apex program, to insert an Account Record. And 10 Related Opportunity Records in the object by using Bulkification Process.( AccountOpportunityInBulk)
 */



public with sharing class AccountOpportunityInBulk {
public static void createInBulk()
{        
        try{
            Account acc=new Account();
            acc.name='AccountInBulkWithOPP';
            insert acc;

            List<opportunity>opp=new List<opportunity>();
            for(Integer i=0;i<=10;i++)
            {
                opportunity op=new opportunity();
                op.Name='AccWithOpportunity:'+i;
                op.CloseDate=date.today();
                op.StageName='Qualification';
                op.AccountId=acc.Id;
                opp.add(op);
            }
		System.debug('List Of Opportunity REcord:-'+opp);
            insert opp;
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }

    }

}