@isTest
public class TestMultiSortParentChild {
@isTest
    public static void testMesthod()
    {
        MultiSortParentChild m=new MultiSortParentChild();
        String res=null;
        Department__c d=new Department__c(Name='cse');
        insert d;
        Employee_SF_Flows__c e=new Employee_SF_Flows__c(Name='Neha',EmpNo__c=01,Department__c=d.id);
        insert e;
        
        Test.startTest();
        res=m.sortMethod();
        Test.stopTest();
        
    }
}