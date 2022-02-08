/**
* @description       : test class for SecondMax class
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Snehal Pawar
**/
@isTest
public class TestSecondMax {
@isTest
    public static void testmaxno()
    {
        SecondMax m=new SecondMax();
     
        integer res=null;
        Test.startTest();
        res=m.findSecondMax();
        Test.stopTest();

    }
}