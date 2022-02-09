/**
* @description       : Sort all the elements  with multicolumn sort when it is is in parent child relationship
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
// Sort all the elements  with multicolumn sort when it is is in parent child relationship
 
 public class MultiColumnParentToChildEx {
     public string display()
     {
         List<Department__c> dept=[select Name,Location__c,(select Name,Salary__c from Employees__r order by Salary__c desc) from Department__c order by Location__c desc];
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