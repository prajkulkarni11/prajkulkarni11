/**
* @description       :test class for sort array with multicolumn sort
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Snehal Pawar
**/
@isTest
public class TestMultiColumn {
@isTest
    public static void testmulticolumnsort()
    {
        SortMultiColumn m=new SortMultiColumn();
       string result=null;
        
        Customer__c cust=new Customer__c(Name='Raj',City__c='Dehli');
        insert cust;
        Test.startTest();
        result=m.display();
        Test.stopTest();
        
    }

}