/**
* @description       : Test Class For Find the maximum No from array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
//Test Class For Find the maximum No from array
@isTest
public class MaxTestClass {
    @isTest
    public static void testmaxno()
    {
        MaximumNo m=new MaximumNo();
     
        integer res=null;
        Test.startTest();
        res=m.maxno();
        Test.stopTest();

    }
}