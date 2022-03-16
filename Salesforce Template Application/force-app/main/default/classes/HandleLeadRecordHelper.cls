/**
* @description       : Create a Trigger to Auto-Convert the Lead Records as the Customers upon Changing the Lead Status as "Closed - Converted".
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class HandleLeadRecordHelper {
    
    public static void createRecords(List<Lead> leadList)   {
        try{
            List<Customer__c> InsertCustList = new List<Customer__c> ();
            
            for(Lead l:leadList)
            {
                if(l.status=='Closed - Converted')
                {
                    Customer__c a=new Customer__c();
                    a.Name__c=l.company;
                    a.Email__c =l.Email;
                    a.Address__c=l.City;
                    InsertCustList.add(a);
                }
            }
           
            insert InsertCustList;
        }catch(Exception e){
        
    } 
    }
}