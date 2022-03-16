/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:10
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:10:34
 * @ Description:6.	Create a Trigger to Auto-Convert the Lead Records as the 
 */


public with sharing class AutoConvertLead {

    public static void createRecords(List<Lead> leadList)   {
        try{
            List<Account> InsertAccList = new List<Account> ();           
             for(Lead l:leadList)
            {
                if(l.status=='Closed - Converted')
                {
                    Account a=new account();
                    a.name=l.company;
                    a.industry=l.industry;
                    a.AnnualRevenue=l.AnnualRevenue;
                    a.Website=l.Website;
                    a.NumberOfEmployees=l.NumberOfEmployees;
                    a.Phone=l.Phone; 
                    a.Fax=l.Fax;  
                    a.Rating=l.Rating;
                    InsertAccList.add(a);      

               
                }
            }

            
            insert InsertAccList;
        }catch(Exception e){

    } 
    }
}