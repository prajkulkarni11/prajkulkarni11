/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:46:19
 * @ Description:Find the second highest value of employee salary
 */

//Display the second highest salary of an employee 


public with sharing class EmpSalary 
{
    public static void display()
    {
    List<Employee__c>emp=new List<Employee__c>();
    emp=[select salary__c,Name from Employee__c order by salary__c desc nulls last limit 1 offset 1];
    System.debug('' + emp);
    }
//select salary__c,Name from Employee__c order by salary__c desc nulls last limit 1 offset 1
}