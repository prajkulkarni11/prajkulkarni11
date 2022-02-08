/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing abstract class AbstractTest {
    protected User user;
    /**
     * Constructor 
     */
    public AbstractTest() {
            // get the system admin user
            user = getSysAdminUser();
            // if no system admin user, default to the current user
            if (user == null) {
                user = getCurrentUser();
                
            }
    }

     
    /**
     * Gets the current user
     * @return the current user
     */
    protected User getCurrentUser() {
        
        // get the current user id
        Id userId = UserInfo.getUserId();
        // get the current user
        List<User> users = [SELECT Id, 
                                   Name, 
                                   ProfileId,
                                   Profile.Name,
                                   UserName,
                                   FirstName,
                                   LastName,
                                   Email,
                                   Title,
                                   TimeZoneSidKey, 
                                   EmailEncodingKey, 
                                   LocaleSidKey, 
                                   LanguageLocaleKey
                            FROM User 
                            WHERE Id = :userId];
        
        return (!users.isEmpty() ? users[0] : null);
    
    }

     /**
     * Gets the system admin user 
     * @return the system admin user
     */
    protected User getSysAdminUser() {
        // get the sys admin profile
        List<Profile> profiles = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        if (profiles.isEmpty()) {
            // profile not found, abort
            return null;
            
        }
        
        // get the system admin user
        List<User> users = [SELECT Id, 
                                   Name, 
                                   ProfileId, 
                                   Profile.Name,
                                   UserName,
                                   FirstName,
                                   LastName,
                                   Email,
                                   Title,
                                   TimeZoneSidKey, 
                                   EmailEncodingKey, 
                                   LocaleSidKey, 
                                   LanguageLocaleKey
                            FROM User 
                            WHERE IsActive = TRUE AND 
                                  ProfileId = :profiles[0].Id LIMIT 1];
        
        return (!users.isEmpty() ? users[0] : null);
    
    }


     
}
