/**
* @description       : Find the Maximum From Array
* @author            : Neha Athawale
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Neha Athawale
**/

/*Find the Maximum From Array */	
public with sharing class FindMaxArray {

    public integer MaximumEle(){
        integer[] arr=new integer[]{2,3,5,1,6};
        integer max=arr[0];
        for(integer count=0;count<arr.size();count++)
        {
            if(max<arr[count])
                max = arr[count];
        }
        system.debug(max);
        return null;
    }
}