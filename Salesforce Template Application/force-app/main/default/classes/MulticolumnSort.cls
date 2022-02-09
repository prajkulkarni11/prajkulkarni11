/**
* @description       :Sort all the elements  with multicolumn sort
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
public class MulticolumnSort {
    
    public String sort()
    {
        List<Employee__c> emp = [select Name,Location__c, Salary__c from Employee__c order by Name desc, Location__c desc];
        
        for(Employee__c e : emp)
        {
            System.debug(e);
        }
        return null;
    }

}