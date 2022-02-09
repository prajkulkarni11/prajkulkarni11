/**
* @description       :Test class for Sort all the elements
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
@isTest
public class Sort1Test {
    
    @isTest
    public static void SortTest()
    {
        Sort1 s = new Sort1();
        Integer result = null;
        
        Test.startTest();
        result = s.sort1();
        Test.stopTest();
    }

}