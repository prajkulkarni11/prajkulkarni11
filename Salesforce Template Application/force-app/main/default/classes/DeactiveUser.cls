
/**
 * @description       : Apex Assignment
 * @author            : Swapnil Thalal
 * @group             : 
 * @last modified on  : 02-03-22
 * @last modified by  : Swapnil Thalal
**/


public with sharing class DeactiveUser {
    public static void deActivateUser(){
        
        List<user> l = [select id, name ,isActive from user where name ='Cynthia Capobianco'];
        
        for(user usr : l){
            usr.isActive = false;
        }
        update l;
    }
    
}