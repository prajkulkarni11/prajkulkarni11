/**
* @description       : sort array elements
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-09-2022
* @last modified by  : Snehal Pawar
**/
public class SortArray {
    public  Integer sortArray() {      
          
         
        integer [] arr = new integer [] {5, 2, 8, 7, 1};   
        integer temp = 0;  
          
      
        System.debug('Elements of  array: ');  
        for (integer count = 0; count < arr.size(); count++) {   
            System.debug(arr[count]);  
        }  
          
         
        for (integer count = 0; count < arr.size(); count++) {   
            for (integer val = count+1; val < arr.size(); val++) {   
               if(arr[count] > arr[val]) {  
                   temp = arr[count];  
                   arr[count] = arr[val];  
                   arr[val] = temp;  
               }   
            }   
        }  
        
        System.debug('Sorted Element');  
        for (integer count = 0; count < arr.size(); count++) {   
            System.debug(arr[count] );  
        } 
        return null;
    }  

}