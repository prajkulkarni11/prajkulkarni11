/* 
*Class Name : FibonacciSeries
*@description: fibonacci Series 
*@author: Girish
*/
public with sharing class FibonacciSeries {
   
    public static void blockMain(){
        Integer n1 = 0;
        Integer n2 = 1; 
        system.debug(n2);
        Integer count =10;
        Integer n3;
        for(Integer i=2;i<count;i++){
            n3= n1+n2;
            system.debug(n3);
            n1=n2;
            n2=n3;
        }
    }
}