/**
* @description       :test class for sort array with multicolumn sort when they have parent child relationship
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Snehal Pawar
**/
@isTest
public class TestMultiColumnWithParentChild {
    @isTest
public static void testallsort()
     {
        MultiColumnWithParentChild mp=new MultiColumnWithParentChild();
        string result=null;
        //for Dept
        Department__c dept=new Department__c(Name='Production',DId__c = '108');
        insert dept;
        //for emp
        Employee__c emp=new Employee__c(Empno__c = 109,Name='Ninad',Department__c=dept.Id,Salary__c=87000);
        insert emp;
       
            
             
        Test.startTest();
        result=mp.sortArray();
        Test.stopTest();
    }
}