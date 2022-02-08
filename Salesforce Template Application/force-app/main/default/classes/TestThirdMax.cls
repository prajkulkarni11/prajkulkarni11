/**
* @description       : test class for ThirdMax class
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Snehal Pawar
**/
@isTest
public class TestThirdMax {
@isTest
    public static void testmaxno()
    {
        ThirdMax m=new ThirdMax();
     
        integer res=null;
        Test.startTest();
        res=m.findThirdMax();
        Test.stopTest();

    }
}