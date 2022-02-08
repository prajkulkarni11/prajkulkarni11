/**
* @description       : Find Second Max No From Array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/
 //Find Second Max No From Array

public with sharing class SecondMaxNo {

    public integer secondMax(){
        integer[] arr= new integer[]{3,2,6,9,1};
         
            integer first= 0;
        integer second= 0;
        
        for(integer count=0; count<arr.size(); count++){
            if(arr[count]>first)
            {
                second=first;
                first=arr[count];
            }
            
            else if(arr[count]>second && arr[count]!=first)
            {
                second=arr[count];
            }
        }
           system.debug(second); 
        return null;
    }
}