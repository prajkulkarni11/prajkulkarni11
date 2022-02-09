/**
* @description       :Test class for Sort all the elements  with multicolumn sort when it is is in parent child relationship
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
@isTest
public class MultisortParentChildTest {
    
    @isTest
    public static void testsort()
    {
    
    MultisortParentChild ms = new MultisortParentChild();
    string result = null;
    
    Departments__c dept = new Departments__c(Name='HR', Location__c ='Mumbai');
    insert dept;
    
    Employee__c emp = new Employee__c(Name='Yash', Department__c=dept.Id, Salary__c=600000);
    insert emp;
    
    Test.startTest();
    result = ms.sort();
    Test.stopTest();
    }

}