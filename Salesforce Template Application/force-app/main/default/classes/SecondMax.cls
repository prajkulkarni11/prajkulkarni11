/**
* @description       : find second maximum number from an array
* @author            : Snehal Pawar
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Snehal Pawar
**/
public with sharing class SecondMax {
    public integer findSecondMax()
    {
    integer [] arr= new integer[]{50,9,64,7,12,41,32};
      for(integer count=0;count<arr.size();count++)
        {
            for(integer tempvar=1;tempvar<arr.size();tempvar++)
            {
                if(arr[count]<arr[tempvar])
            {
                integer temp;
                temp=arr[count];
                arr[count]=arr[tempvar];
                arr[tempvar]=temp;
              
            }
            }
            
        }
        integer tempvar=arr.size()-2;
            system.debug(arr[tempvar]);
     
        return null;
    }
}