/**
* @description       :Test class for Sort all the elements  with multicolumn sort
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
@isTest
public class MulticolumnSortTest {
    
    @isTest
    public static void MulticolumnTest()
    {
        MulticolumnSort ms = new MulticolumnSort();
        String result = null;
        
        Employee__c emp = new Employee__c(Name = 'Raju', Location__c = 'Aurangabad', Salary__c = 250000);
        insert emp;
        
        Test.startTest();
        result = ms.sort();
        Test.stopTest();
    }

}