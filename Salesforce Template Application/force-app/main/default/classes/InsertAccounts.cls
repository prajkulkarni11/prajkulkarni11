
/**

 * @File Name          : InsertAccounts.cls
 * @Description        : Collection Assignment 03:Write an apex program, to insert an Account Record. And 10 Related Opportunity Records in the object by using Bulkification Process.
Florida.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 4:40:39 pm
* @Modification Log   : 

 **/

public with sharing class InsertAccounts {

    public static void insertAccountWithOpportnity(){
        try{
            Account acc=new Account();
            acc.name='AssignmentAccount';
            insert acc;

            List<opportunity>oppList=new List<opportunity>();
            for(Integer i=0;i<=10;i++)
            {
                opportunity opp=new opportunity();
                opp.Name='AssignmentOpportunity:'+i;
                opp.CloseDate=date.today();
                opp.StageName='Needs Analysis';
                opp.AccountId=acc.Id;
                oppList.add(opp);
            }

            insert oppList;
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }

    }
}