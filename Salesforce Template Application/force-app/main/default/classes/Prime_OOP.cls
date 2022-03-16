/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-15 18:16:01
 * @ Modified by: Your name
 * @ Modified time: 2022-03-16 11:00:51
 * @ Description://check given number is prime or not

 */


public with sharing class Prime
{
    public void checkPrimeOrNot(Integer num)
    {
        Integer cnt=0;
        for(Integer i=2;i<num;i++)
        {            
            if(math.mod(num,i)==0)
            {
                cnt++;
            }
        }        
        if(cnt!=0)
        {  system.debug(+num+ 'is not a prime number'); }
        else
               system.debug(+num+ 'is a prime number'); 
    }
}
//Execution:
//Prime p=new Prime();
//p.checkPrime(12);