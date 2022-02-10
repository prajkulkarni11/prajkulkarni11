public with sharing class MultiSortEle {
    public string SortMethod()
        {
            List<Employee_Details__c> emp=[select Employee_Name__c,Email_ID__c,City__c,Mobile_Number__c,Adhar_Number__c,PIN__c from Employee_Details__c order by Employee_Name__c asc,Email_ID__c asc,City__c asc ];
            for(Employee_Details__c e:emp)
            {
                system.debug(e);
            }
            return null;
        }
}