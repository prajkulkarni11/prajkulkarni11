/**
 * @File Name          : UpdateManager.cls
 * @Description        : Assignment 3: Write an apex program, to Update the Hiring Managers whose name starting with "Apex HR" we below. Location = 'Pune' Contact Number = '9876543210'
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
Public with sharing Class UpdateManager {
    
    Public static void updateHM()
    {
        //soql query to fetch records from database
        List<Hiring_Manager__c> hiringManagerList=[select id,Location__c,Contact_Number__c from Hiring_Manager__c where name like 'Apex HR%'];
        try{
            if(hiringManagerList.size()>0)
            {
                for(Hiring_Manager__c obj:hiringManagerList)
                {
                    obj.Location__c='Pune';
                    obj.Contact_Number__c='9876543210';
                }
                update hiringManagerList;
            }
        }
        catch(DmlException e){
            
            system.debug('exception error :'+e.getCause());
        }
    }
    
}