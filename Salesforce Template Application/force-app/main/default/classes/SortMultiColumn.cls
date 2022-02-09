/**
* @description       : sort array elements with multicolumn sort
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Snehal Pawar
**/
public class SortMultiColumn {
  public string display()
    {
        List<Customer__c> cust=[select Name,City__c from Customer__c order by City__c asc, Name asc ];
        for(Customer__c c:cust)
        {
            system.debug(c);
        }
        return null;
    }
        
}