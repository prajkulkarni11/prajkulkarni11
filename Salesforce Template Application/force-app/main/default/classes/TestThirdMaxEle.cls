/**
* @description       : Test class find the third max from array
* @author            : Neha Athawale
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Neha Athawale
**/
@isTest
public class TestThirdMaxEle {

    @isTest
    public static void MaxEle()
    {
        ThirdMaxEle t= new ThirdMaxEle();
        Test.startTest();
        integer result = t.MaximumThirdEle();
        Test.stopTest();
    }
}