/**
* @Class Name        : EmployeeSalaryD3e1
* @description       : Querying on Employee Object to find 2nd highest salary
* @author            : Girish
**/ 
public with sharing class EmployeeSalaryD3e1 {
    public static void main(){
        Employee__C empMain = new EMployee__c();
         
       List <Employee__C> emp = [select id,name,Salary__c from Employee__c where salary__c !=null order by Salary__c desc limit 1 offset 1 ];
        if(emp.size()>0){
            empMain = emp[0];
            system.debug('Second highest salaey is'+empMain.salary__c);
             system.debug(empMain);
        }
        
    }
}