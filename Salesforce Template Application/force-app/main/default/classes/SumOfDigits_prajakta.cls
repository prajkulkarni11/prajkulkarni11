/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-15 14:17:16
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 14:30:44
 * @ Description:print sum of digits
 */

//print sum of digits
public with sharing class Sumofdigits {
  public void sumDigit(Integer iNum)
    {
        Integer iRem = 0, iSum = 0;
        while(iNum > 0)
        {
            
            
            
            iRem = math.mod(iNum, 10);
            iSum = iSum + iRem;
            iNum = iNum/ 10;
        }
        System.debug('Sum of Digits = '+iSum);
    }
}
