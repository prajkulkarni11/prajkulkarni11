/**
* @description       : Sort all the elements
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Minal Patil
**/
public class Sort1 {
		
    public Integer sort1(){
        integer[] arr = new integer[]{12,98,34,56,65};
            
            for(integer num=0; num<arr.size(); num++){
                for(integer count=num+1; count<arr.size(); count++){
                    
                    integer temp = 0;
                    if(arr[num]>arr[count]){
                        temp=arr[num];
                        arr[num]=arr[count];
                        arr[count]=temp;
                    }
                }
                System.debug(arr[num]);
            }
        return null;
    }
}