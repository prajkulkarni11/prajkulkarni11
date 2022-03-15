/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-15 14:17:17
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 14:27:16
 * @ Description:check given number is prime or not
 */

//check given number is prime or not
public with sharing class  Primenumbernew
{
    public static void checkPrimeOrNot(Integer num)
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

