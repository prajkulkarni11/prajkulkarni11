/* 
*Class Name : CheckPalindrome
*@description: checking given number is palindrome or not 
*@author: Girish
*/
public with sharing class CheckPalindrome {
    public static void blockMain(){
        integer num = 121;
        integer temp1;
         integer temp2 = num;
        integer finalTemp = 0;
        
        while(num>0){
            temp1 = math.mod(num, 10) ;
            finalTemp = finalTemp*10 + temp1 ;
            num = num/10;
        }
        if(finalTemp == temp2){
            system.debug('Given number is palindrome '+finalTemp);
        }
        else
        {
            system.debug('not palindrome '+finalTemp);
        }
        
    }
}