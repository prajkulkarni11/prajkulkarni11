/**

 * @File Name          : HandlerLeadRecord.cls
 * @Description        : Collection Assignment 06:Create a Trigger to Auto-Convert the Lead Records as the Customers upon Changing the Lead Status as "Closed - Converted".  
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 4:40:39 pm
* @Modification Log   : 

 **/

public class HandlerLeadRecord {
    
    public static void createRecords(List<Lead> leadList)   {
        for(Lead l:leadList)
        {
            if(l.status=='Closed - Converted')
            {
                Account a=new account();
                a.name=l.company; a.industry=l.industry; a.AnnualRevenue=l.AnnualRevenue; a.Website=l.Website;
                a.NumberOfEmployees=l.NumberOfEmployees; a.Phone=l.Phone; a.Fax=l.Fax;   a.Rating=l.Rating;
                try
                {
                    insert a;
                }
                catch (DmlException e)
                {}
                
                contact c=new contact();
                c.LastName=l.LastName;   c.AccountId=a.Id;
                try
                {
                    insert c;
                }
                catch (DmlException e)
                {}
                
                Opportunity op=new Opportunity();
                op.Name=l.Company;
                op.AccountId=a.Id;
                op.LeadSource=l.LeadSource;
                op.CloseDate=system.today();
                op.StageName='prospecting';
                try
                {
                    insert op;
                }
                catch (DmlException e)
                {}
                
            }
        }
    }
}