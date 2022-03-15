/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-15 14:17:17
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 14:30:12
 * @ Description:check palindrome or not
 */

//check palindrome or not
public with sharing  class Palindrome {
    public static   void chkPalin(Integer num)
    {
    	Integer i = 0, j = 0, k = 0;
        k = num;
        
        while(num > 0)
        {
            i = math.mod(num,10);
            j = j * 10 + i;
            num = num / 10;
        }
        
        if(k == j)
        {
            System.debug('Palindrome number');
        }
        else
        {
            System.debug('Not a Palindrome number');
        }
    }
    
}