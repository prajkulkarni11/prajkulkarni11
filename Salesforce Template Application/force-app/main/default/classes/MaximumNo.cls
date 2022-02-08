/*
 Find the maximum No from array
  */
public class MaximumNo {
   public void maxno(){

    
     integer [] arr = new integer [] {25, 11, 7, 75, 56};  
         
        integer max = arr[0];  
        
        for (integer i = 0; i < arr.size(); i++) {  
             
           if(arr[i] > max)  
               max = arr[i];  
        }  
        System.debug('Max number in array' + max);  
    }  
    
       
}