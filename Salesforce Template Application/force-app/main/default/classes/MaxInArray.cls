/**
* @description       : find maximum number from an array
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Snehal Pawar
**/
public with sharing class MaxInArray {
    public integer findMax()
    {
    integer [] arr=new integer[]{6,8,4,2,6};
        integer max=arr[0];
           for(integer count=0;count<arr.size();count++)
    {
        if(arr[count]>max)
        {
            max=arr[count];
        }
    }
        system.debug('max from an array'+max);
        return null;
        }
}