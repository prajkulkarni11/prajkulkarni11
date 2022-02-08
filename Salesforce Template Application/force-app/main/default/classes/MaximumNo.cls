/**
* @description       : Find the maximum No from array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
   // Find the maximum No from array
  
public with sharing class  MaximumNo {
   public Integer maxno(){

    
     integer [] arr = new integer [] {25, 11, 7, 75, 56};  
         
        integer max = arr[0];  
        
        for (integer count = 0; count < arr.size(); count++) {  
             
           if(arr[count] > max)  
               max = arr[count];  
        }  
        System.debug('Max number in array' + max);  
       return null;
    }  
    
       
}