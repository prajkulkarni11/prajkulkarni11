/**
 * @ Author:Aishwarya Shelke
 * @ Create Time: 2022-03-19 13:58:53
 * @ Modified by: Your name
 * @ Modified time: 2022-03-19 14:00:42
 * @ Description://2.Write Test Classes with 80%+ code coverage for the solution code of above questions.
//test Class for checking duplicate email before inserting new employee record
 */


@isTest
public class TestForEmailCheckDuplicate {

    @isTest static void emailCheckBeforeInsert()
    {
        Employee__c emp= new Employee__c(Name='Aishwarya123345',email__c='aisheagsgcv4566@gmail.com');
        Test.startTest();
        insert emp;
        Test.stopTest();
    }
}