/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-15 12:26:16
 * @ Modified by: Your name
 * @ Modified time: 2022-03-16 15:55:38
 * @ Description:print sum of digits

 */

public with sharing class SumOfDigits
{
    Integer sum=0,m;
	public void sum(Integer num)
    {
        while(num>0)    
        {    
            m=math.mod(num,10);    
            sum=sum+m;    
            num=num/10;    
        }    
        system.debug('Sum of digits is :'+ sum);
    }
}
//SumOfDigits s= new SumOfDigits();
//s.sum(123);