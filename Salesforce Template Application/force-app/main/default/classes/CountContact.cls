/**

 * @File Name          : CountContact.cls
 * @Description        :  SOQL Assignment 04:display all accounts and its count of associated contacts
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 5:40:39 pm
* @Modification Log   : 

 **/

public with sahring class CountContact {
    
    public static void  getCountContact(){

        try{
            List<AggregateResult> con=[Select Count(Id),Account.Name from Contact where Account.Id != null GROUP BY Account.Name];

            for(AggregateResult cont:con){
                system.debug('List:-'+cont);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }

}