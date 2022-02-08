/**
* @description       : Find the Third Max No from Array
* @author            : Swati Bhagat
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Swati Bhagat
**/

    //Find the Third Max No from Array
 
public with sharing class  ThirdMaxNo {
    public Integer thirdMax(){
        integer[] arr= new integer[]{3,2,6,9,1};
            
            integer first=0;
            integer second=0;
        	integer third=0;
        
        for(integer count=0; count<arr.size(); count++){
            if(arr[count]>first)
            {
                third=second;
                second=first;
                first=arr[count];
            }
            
            else if(arr[count]>second && arr[count]!=first)
            {
                second=arr[count];
            }
            
            else if(arr[count]>third && arr[count]!=second)
            {
                third=arr[count];
            }
        }
        system.debug(third);
        return null;
    }

}