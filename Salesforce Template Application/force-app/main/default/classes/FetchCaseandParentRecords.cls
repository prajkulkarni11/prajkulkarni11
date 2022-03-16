/**
 * @File Name          : FetchCaseandParentRecords.cls
 * @Description        : Assignment 8: Write an apex program, to fetch the Case Details based on the specified Case Number and fetch all the associated Parent Details(Contact), Grand Parent details(Account),..etc.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
Public with sharing class FetchCaseandParentRecords {
    
    Public static void getCaseRelatedRecords()
    {
        //soql query to fetch records from database
        List<case> caseList=[select id,Account.name,Contact.lastname,CaseNumber,origin from case where casenumber like '00001028'];
        try{
            if(caseList.size()>0){
                
                
                for(Case c:caseList)
                {
                    system.debug('account name'+c.Account.name);
                    system.debug('account name'+c.Contact.lastname);
                    
                }
            }
        }
        catch(Exception e){
            system.debug('exception error :'+e.getCause());
        }
    }
    
}