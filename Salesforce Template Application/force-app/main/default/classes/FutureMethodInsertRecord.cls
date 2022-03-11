/**
* @Class Name        : FutureMethodInsertRecord 
* @description       : Create a Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.
* @author            : Amar Giram
* @group             : 
* @last modified on  : 08-03-2022
* @last modified by  : Amar Giram
**/

public with sharing class FutureMethodInsertRecord  {
    
    @future
    public static void deactivate_user()
    {     
        List<User> users = [Select IsActive, id from User where username=:'amarng777@gmail.com'];
        List<User> lstUsers = new List<User>();
        try{
            if(!users.isempty())
            {
                for(User u: users)
                {
                    u.IsActive = false;
                    lstUsers.add(u);
                }
            }    
            update lstUsers;
            
            Hiring_manager__c h=new Hiring_manager__c();
            h.name='AmarGiram';
            h.Location__c='Pune';
            h.Contact_Number__c='8796666712';
            insert h;
            
        }catch(DMLException e) {
            system.debug(e.getMessage());
        }    
    }
    
}