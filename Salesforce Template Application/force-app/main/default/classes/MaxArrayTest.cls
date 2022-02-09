//Find the Maximum From Array
/**
* @description       : 
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
@isTest
public class MaxArrayTest {
    @isTest
    public static void testMaxNo()
    {
       MaxArray m = new MaxArray();
        
        integer res = null;
        Test.startTest();
        res=m.max();
        Test.stopTest();
    }

}