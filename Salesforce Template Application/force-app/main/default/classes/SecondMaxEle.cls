/**
* @description       : Find the Second Maximum From Array
* @author            : Neha Athawale
* @group             : 
* @last modified on  : 02-08-2022
* @last modified by  : Neha Athawale
**/

/*Find the Second Maximum From Array */
public with sharing class SecondMaxEle {
    public integer MaximumSecEle()
    {
    		integer[] arr=new integer[]{2,3,5,1,6};
         	integer temp=0;
        for(integer row=0;row<arr.size();row++)
        {
            for(integer col=row+1;col<arr.size();col++)
            {
                if(arr[row]<arr[col])
                {
                            temp=arr[row];
                            arr[row]=arr[col];
                            arr[col]=temp;
                }
            }
        }
             system.debug('Second largest ele is '+arr[1]);
        	return null;
    }
    
}