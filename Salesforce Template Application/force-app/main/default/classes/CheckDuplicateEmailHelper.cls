/**
* @description       :  Write a trigger to check duplicate email on employee object
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class CheckDuplicateEmailHelper {
    public static void duplicateEmailValidation(List<Employee__c>newEmpList){
        Set<String>setStr=new Set<String>();
        List<Employee__c>emList=[select id,name,email__c from employee__c];
        for(Employee__c emp:emList)
        {
            setStr.add(emp.email__c);
        }
        
        for(Employee__c em:newEmpList)
        {
            if(setStr.contains(em.email__c))
            {
                em.email__c.adderror('duplicate email found:');
            }
        } 
    }
}