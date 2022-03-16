/*@Class Name        : MixedDMLOperation 
* @description       : Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.
* @author            : Girish
**/

public with sharing class MixedDMLOperation  {

    @future
    public static void deactivate_user()
    {     
        List<User> users = [Select IsActive, id from User where username=:'varadaa@gmail.com'];
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
            h.name='FutureMEthod';
            insert h;

        }catch(DMLException e) {
            system.debug(e.getMessage());
        }    
    }

}