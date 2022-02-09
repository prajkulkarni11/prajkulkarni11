/**
* @description       :Test class for sort all the element
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Swati Bhagat
**/
//Test class for sort all the element
@isTest
public class SortTestClass {

    @isTest
    public static void testsort()
    {
        SortEx s=new SortEx();
        Integer result=null;
        Test.startTest();
        result=s.SortArray();
        Test.stopTest();
    }
}