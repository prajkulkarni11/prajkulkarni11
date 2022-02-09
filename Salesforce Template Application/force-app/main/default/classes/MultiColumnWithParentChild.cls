/**
* @description       : sort array elements with multicolumn sort when they have parent child relationship
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Snehal Pawar
**/
public class MultiColumnWithParentChild {
 public string sortArray()
     {
         List<Department__c> dept=[select Name,(select Name,salary__c from Employees__r order by salary__c desc) from Department__c order by Name desc];
             for(Department__c d:dept)
             {
                 system.debug(d);
                 for(Employee__c e:d.Employees__r)
                 {
                     system.debug(e);
                 }
             }
         return null;
     }

}