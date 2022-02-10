@isTest
public class TestMultiSortEle {
@isTest
    public static void testSortMethod()
    {
        MultiSortEle s=new MultiSortEle();
       string result=null;
        
        Employee_Details__c emp=new Employee_Details__c(Employee_Name__c='Neha',Email_ID__c='neha@gmail.com',City__c='Pune',Mobile_Number__c='8457845784',Adhar_Number__c='541245121457',PIN__c='451247');
        insert emp;
        Test.startTest();
        result=s.SortMethod();
        Test.stopTest();
        
    }
}