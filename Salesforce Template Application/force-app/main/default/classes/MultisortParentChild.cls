/**
* @description       :Sort all the elements  with multicolumn sort when it is is in parent child relationship
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/

public class MultisortParentChild {

    public string sort()
     {
         List<Departments__c> dept=[select Name,(select Name,Salary__c from Employee__r order by Salary__c desc) from Departments__c order by Name desc];
             for(Departments__c d:dept)
             {
                 system.debug(d);
                 for(Employee__c e:d.Employee__r)
                 {
                     system.debug(e);
                 }
             }
     
         
         return null;
     }
}