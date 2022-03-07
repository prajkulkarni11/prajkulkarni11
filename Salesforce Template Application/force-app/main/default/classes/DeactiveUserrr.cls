/**

 * @File Name          : DeactiveUserrr.cls
 * @Description        :Asynchronous Apex Assignment 03:Create a Future Method, to Insert a Hiring Manager Record and to De-Activate a User Record.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 3:40:39 pm
* @Modification Log   : 

 **/

public with sharing class DeactiveUserrr {
    
    public static void deactivatingUser(){
        
        user u = [select id,name,isActive from user where name ='Cynthia Capobianco'];
        u.isActive = false;
        update u;
    }
    
    @Future
    public static void createManager(){
        Account acc = new Account();
        acc.name ='Hiring Manager';
        insert acc;
    }
    
}