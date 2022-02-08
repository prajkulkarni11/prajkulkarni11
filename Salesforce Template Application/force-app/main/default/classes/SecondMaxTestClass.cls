/**
* @description       : Test Class For Find Second Max No From Array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
//Test Class For Find Second Max No From Array
@isTest
public class SecondMaxTestClass {
    @isTest
    public static void testSecondMax()
    {
        SecondMaxNo sm=new SecondMaxNo();
        integer result=null;
        Test.startTest();
        result=sm.secondMax();
        Test.stopTest();
    }

}