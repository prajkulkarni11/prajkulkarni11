/* 
*Class Name : SumOfNumber
*@description: adding the sum of given number
*@author: Girish
*/
public with sharing class SumOfNumber {
    public static void blockMain(){
        integer num = 63;
        integer temp;
        integer sum=0;
        integer temp2= num;
        
        while (num>0){
            temp = math.mod(num, 10);
            sum = sum+temp;
            num=num/10;
        }
		system.debug('sum of '+temp2 +' is '+sum);        
    }
}