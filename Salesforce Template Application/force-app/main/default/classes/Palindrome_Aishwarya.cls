/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-15 12:26:16
 * @ Modified by: Your name
 * @ Modified time: 2022-03-16 14:58:48
 * @ Description://check palindrome or not

 */

public with sharing class Palindrome {
    Integer r, sum=0, temp;
    public static void check(Integer num)
    {
        temp=num;
        while(num>0)
        {
            r=math.mod(num,10);    
			sum=(sum*10)+r;    
			num=num/10;    
        }
        if(temp==sum)
            system.debug(' It is a palindrome :');
        else
            system.debug('It is a not a palindrome');
    }

}
//Palindrome.check(1512);