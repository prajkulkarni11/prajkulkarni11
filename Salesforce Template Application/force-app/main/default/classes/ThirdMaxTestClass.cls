/**
* @description       : Test Class For Find the Third Max No from Array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
// Test Class For Find the Third Max No from Array
@isTest
public class ThirdMaxTestClass {
    @isTest
    public static void testThirdMax()
    {
        ThirdMaxNo tm=new ThirdMaxNo();
        Integer result=null;
        Test.startTest();
        result=tm.thirdMax();
        Test.stopTest();
        
    }

}