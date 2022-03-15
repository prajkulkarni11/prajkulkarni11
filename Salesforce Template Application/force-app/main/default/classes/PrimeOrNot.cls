/* 
*Class Name : PrimeOrNot
*@description: checking given number is prime or not 
*@author: Girish
*/
public with sharing class PrimeOrNot {
    public static void blockMain(){
        integer num = 4;
        //boolean check= false;
        for(integer i=2;i<=num;i++){
            if(math.mod(num,i) ==0){
                system.debug('No, it is not Prime');
                break;
            }
            else{
                system.debug('Yes, it is prime');
                break;
            }
        }
       
    }
}