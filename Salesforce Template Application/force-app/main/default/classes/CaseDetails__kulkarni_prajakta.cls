//, to fetch the Case Details based on the specified Case Number and fetch all the associated Parent Details(Contact), Grand Parent details(Account)
public class CaseDetails
{
public static void searchForCases(){ 
        
        List<Case> clist = [select id,Account.name,Contact.lastname,CaseNumber,origin from case where CaseNumber Like'00001016' ];
    try{
        if(clist.size()>0)
        {
            for(case cc:clist)
            {
                system.debug('Account Name:--' +cc.Account.name);
                system.debug('Contact Name:--' +cc.Contact.lastname);
            }   
        }
    }   
    catch(DMLEXCEPTION e)
    {
        
    }
        //return clist;
    }
}