/**
* @description       : Test class Find the Second Maximum From Array
* @author            : Neha Athawale
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Neha Athawale
**/
@isTest
public class TestSecondMaxEle {

    @isTest
    public static void TestMax()
    {
        SecondMaxEle m=new SecondMaxEle();
     
        Test.startTest();
        integer result=m.MaximumSecEle();
        Test.stopTest();

    }
}