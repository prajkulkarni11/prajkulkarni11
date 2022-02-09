/**
* @description       :Sort all the elements  with multicolumn sort
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
// Sort all the elements  with multicolumn sort 
 
public class MulticolumnSortEx {
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