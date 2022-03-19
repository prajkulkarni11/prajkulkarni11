/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:59:56
 * @ Description:Write Test Classes with 80%+ code coverage for the solution code of above questions.
//test Class for checking duplicate email before inserting new employee record
 */


//2.Write Test Classes with 80%+ code coverage for the solution code of above questions.
//test Class for checking duplicate email before inserting new employee record
@isTest
public with sharing class TestForEmailCheckDuplicate {

    @isTest static void emailCheckBeforeInsert()
    {
        Employee__c emp= new Employee__c(Name='Aishwarya123345',email__c='aisheagsgcv4566@gmail.com');
        Test.startTest();
        insert emp;
        Test.stopTest();
    }
}