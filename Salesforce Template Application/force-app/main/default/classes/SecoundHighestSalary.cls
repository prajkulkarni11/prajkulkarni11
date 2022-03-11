/**
 * @File Name          : SecoundHighestSalary.cls
 * @Description        : Display the second highest salary of an employee
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class SecoundHighestSalary {
    
    public static void displaySecoundHighestSalary(){
        try{
            List<Employee__c>secondHighestSalary=[SELECT id,name,salary__c FROM employee__c ORDER BY salary__c DESC NULLS LAST limit 1 offset 1];
            System.debug('Second Highest Salary:'+secondHighestSalary);
            
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }    
}