/**
* @description       :Test class for sort all the elements  with multicolumn sort 
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Swati Bhagat
**/
//Test class for sort all the elements  with multicolumn sort 
@isTest
public class MulticolumnsortTestClass {
    @isTest
    public static void testmulticolumnsort()
    {
        MulticolumnSortEx m=new MulticolumnSortEx();
       string result=null;
        
        Customer__c cust=new Customer__c(Name='Punit',City__c='Gujrat');
        insert cust;
        Test.startTest();
        result=m.display();
        Test.stopTest();
        
    }

}