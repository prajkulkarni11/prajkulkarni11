public with sharing class DeactivateUser {
    public DeactivateUser() {

    }
    public static void userDeactivate(){
        User us= [SELECT Username
                        FROM  User 
                        WHERE username='akshay1992sr@gmail.com'];
                us.IsActive= false;
                update us;
                 system.debug(+us);
                
                
            }     
}