/**
* @description       :Test class for  Sort all the elements  with multicolumn sort when it is is in parent child relationship
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Swati Bhagat
**/
//Test class for  Sort all the elements  with multicolumn sort when it is is in parent child relationship

@isTest
public class MulticolumnParentChildTestClass {
    @isTest
    public static void testallsort()
    {
        MultiColumnParentToChildEx mp=new MultiColumnParentToChildEx();
        string result=null;
        //for Dept
        Department__c dept=new Department__c(Name='Support',Location__c='5th floor');
        insert dept;
        //for emp
        Employee__c emp=new Employee__c(Name='Aarav',Department__c=dept.Id,Salary__c=25000);
        insert emp;
       
            
            
        Test.startTest();
        result=mp.display();
        Test.stopTest();
    }

}