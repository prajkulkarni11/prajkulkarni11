public with sharing class MultiSortParentChild {

    public string sortMethod()
     {
         List<Department__c> dept=[select Name,(select Name,EmpNo__c,Department__c from Employee_SF_Flows__r order by EmpNo__c desc) from Department__c order by Name desc];
             for(Department__c d:dept)
             {
                 system.debug(d);
                 for(Employee_SF_Flows__c emp:d.Employee_SF_Flows__r)
                 {
                     system.debug(emp);
                 }
             }
         return null;
     }

}