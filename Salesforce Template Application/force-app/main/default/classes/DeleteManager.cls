/**
 * @File Name          : DeleteManager.cls
 * @Description        : Assignment 1: Write an apex program, to Delete the Records from the Hiring Manager object whose name is starting with the specified Characters
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/

Public with Sharing Class DeleteManager {
    Public static void deleteHiringManager()
    {
        //soql query to fetch records from database
        List<Hiring_Manager__c> hiringManager=[select id,name from Hiring_Manager__c where name like 'a%'];
        try{
            if(hiringManager.size()>0)
            {
                delete hiringManager;
            }
        }
        catch(DmlException e)
        {
            System.debug('Error Message is :-'+e.getStackTraceString());
        }
    }
}