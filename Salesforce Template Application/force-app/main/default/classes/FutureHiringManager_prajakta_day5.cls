/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 12:42:45
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 12:47:34
 * @ Description:Create a Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.
 */

//3.	Create a Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.



public with sharing class FutureHiringManager {
    Public static void DoDMLOperations()
    {
        // De-Activate the User Record.. (Setup Object)
        User userToDeActivate = [Select id, username, isActive
                                 from User
                                 Where username = 'ashwini105@gmail.com'
                                 Limit 1];
        if(userToDeActivate.id != null)
        {
            userToDeActivate.IsActive = false;
            
            update userToDeActivate;
            
            // Invoke the Method to Create HR Record..
            CreateHRRecord();
        }
    }
    
    
    
    
    
    @future()
    public static void CreateHRRecord()
    { 
        HiringManager__C hrRecord = new HiringManager__C();
        
        hrRecord.Name = 'Akshay Sorte';
        hrRecord.Location__c = 'Pimpri';
        hrRecord.Contact__c = '';
        
        
        insert hrRecord;
        
    }
}