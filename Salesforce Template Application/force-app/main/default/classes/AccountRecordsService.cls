/* *
 * @ClassName : AccountRecordsService
 * @Description : webservice programs
 * @author : Girish
*/

@RestResource(URLMapping='/AccountsService/*')
Global with sharing class AccountRecordsService 
{
    @HttpGet()
	Global static List<Account> GetAllAccounts()
    {
        List<Account> lstAccounts = [Select id, name, rating, annualrevenue, phone, fax,
                                    				type, ownership, customerpriority__C, active__c
                                    						from Account
                                    							Order by name];
        
        return lstAccounts;
    }
    @HttpPost()
    Global static String CreateNewContact(string fName, string lName, string cTitle, string cEmail)
    {
        Contact con = new Contact();
        	con.FirstName = fName;
        	con.LastName = lName;
        	con.Title = cTitle;
        	con.Email = cEmail;

        
        insert con;
        
        if(con.Id != null)
        {
            return 'Contact Record Created with ID..: '+ con.Id;
        }
        else
            return 'Contact Record Creation has been Failed.';
        	
    }
    
    @HTTPDelete()
   Global static String deleteAcc() {
       Map<string, string> inputParam = RestContext.request.params;
       
       List<Account> acclist = [Select id,name from account where name =: inputparam.get('accname')];
       
       if(!acclist.isEmpty()){
           return 'Record Deleted Successful';
       }
       else 
           return 'Record not found';
        
    }
    
    
    
    
}