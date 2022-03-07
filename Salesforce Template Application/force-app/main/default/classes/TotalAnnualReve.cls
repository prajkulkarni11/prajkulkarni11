/**

 * @File Name          : TotalAnnualReve.cls
 * @Description        : soql & sosl Assignment 05:display sum of all annual revenue of accounts
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 6:40:39 pm
* @Modification Log   : 

 **/

public with sharing class TotalAnnualReve {
    
    public static void salarySeconHigh(){
        Try{
        
        List<Account> AccList=[select id,annualrevenue from account where annualrevenue != null];
         double total;     
        if(AccList!=null && !AccList.isEmpty()) {
            for(Account acc : AccList){
                total = total + acc.AnnualRevenue;           
            }
        }
            System.debug('Total Annual revenue' + total);
       }
            catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
            
            
            
        }
    }