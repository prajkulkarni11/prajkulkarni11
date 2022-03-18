/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:56:21
 * @ Description:Write a program to handle DMLException,NullPointerException,SOQLException in your code.
 */


//3,Write a program to handle DMLException,NullPointerException,SOQLException in your code.
public with sharing class ExceptionalClass {
    
    public static void exceptionMethod(){
        try {
            Account acc = new Account();
            insert acc;
        } catch(DmlException e) {
            System.debug('exception occurred: ' + e.getMessage());
            system.debug(e.getTypeName());
        }
        try {
            String s;
            Boolean b = s.contains('abc'); // Causes a NullPointerException
        } catch(NullPointerException n) {
            System.debug('exception has occurred: ' + n.getMessage());
            system.debug(n.getTypeName());
        }
        try{
            List<Employee__c> emp=[select name from employee__c where name='ABCD'];
            system.debug(''+emp.size());
            Employee__c e=[select name from employee__c where name='ABCD' limit 1];
            
        }catch(QueryException q){
            system.debug(q.getMessage());
            system.debug(q.getTypeName());
        }
    }
    
}