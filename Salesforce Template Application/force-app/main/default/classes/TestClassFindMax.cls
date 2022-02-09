/**
* @description       : Find the Maximum From Array
* @author            : Neha Athawale
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Neha Athawale
**/
@isTest
public class TestClassFindMax {
    @isTest
    public static void TestMax()
    {
        FindMaxArray m=new FindMaxArray();
     
        integer result=null;
        Test.startTest();
        result=m.MaximumEle();
        Test.stopTest();

    }
}