/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-22 16:21:07
 * @ Modified by: Your name
 * @ Modified time: 2022-03-22 16:26:06
 * @ Description: //3.create a visual force page with username and password and validate through java script by implementing 
//the concept of action function tag? 
 */


public with sharing class ActionVF 
{
    public String ReturnValue {get;set;}
      public String FirstName {get;set;}
      public String LastName {get;set;}
     
      public void Result()
      {
          ReturnValue = 'My name is : ' + FirstName +' '+ LastName ;
      }
    
}    