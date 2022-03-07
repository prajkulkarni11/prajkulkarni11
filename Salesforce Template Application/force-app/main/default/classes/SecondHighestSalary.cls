
/**

 * @File Name          : SecondHighestSalary.cls
 * @Description        : soql & sosl Assignment 04:display the second highest salary of an employee
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 5:40:39 pm
* @Modification Log   : 

 **/
public with sharing class SecondHighestSalary {
    
            public static void salarySeconHigh(){

        try{
            List<Employee1__c> listOfEmployee=[SELECT Salary__c FROM Employee1__c ORDER BY Salary__c DESC NULLS LAST limit 1 offset 1];

            for(Employee1__c Emp:listOfEmployee){
                system.debug('List of Employee are:-'+Emp);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }

}