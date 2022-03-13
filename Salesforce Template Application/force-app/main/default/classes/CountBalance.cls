/**

 * @File Name          : CountBalance.cls
 * @Description        :  SOQL Assignment 04:count the individual balance from contact group by name having count of individual balance greater than 1000
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 6:40:39 pm
* @Modification Log   : 

 **/

public with sharing class CountBalance {
    
 public static void  getCountBalance(){

        try{
            List<AggregateResult> con=[Select Name, Count(Balance__c) from contact group by name having Count(name)>1000];

            for(AggregateResult cont:con){
                system.debug('List:-'+cont);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }
}