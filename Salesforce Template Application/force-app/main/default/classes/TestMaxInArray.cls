/**
* @description       : test class for MaxInArray class
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Snehal Pawar
**/
@isTest
public class TestMaxInArray {
 @isTest
    public static void testmaxno()
    {
        MaxInArray m=new MaxInArray();
     
        integer res=null;
        Test.startTest();
        res=m.findMax();
        Test.stopTest();

    }
}