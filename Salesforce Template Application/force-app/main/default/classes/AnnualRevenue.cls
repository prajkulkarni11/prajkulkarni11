/**
 * @File Name          : AnnualRevenue.cls
 * @Description        : display sum of all annual revenue of accounts
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class AnnualRevenue {
    
    public static void displaySumOfAnnualRevenue(){
        try{
            List<AggregateResult>acclistAnnulRevenue=[SELECT sum(AnnualRevenue) FROM Account];
            System.debug('Sum Of Annual Revenue:'+acclistAnnulRevenue);
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());            
        }
    }
    
}