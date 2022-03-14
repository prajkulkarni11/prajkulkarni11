/**

 * @File Name          : GetNameLasDays.cls
 * @Description        :  SOQL Assignment 01:get names and created date of all the account records which are created in the last 30 days
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 4:40:39 pm
* @Modification Log   : 

 **/

public with sharing class GetNameLasDays {

        public static void displayLastDays(){

        try{
            List<Account> acclist=[SELECT name FROM Account WHERE LastModifiedDate < LAST_N_DAYS:30];

            for(Account acc:acclist){
                system.debug('List:-'+acc);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }
}