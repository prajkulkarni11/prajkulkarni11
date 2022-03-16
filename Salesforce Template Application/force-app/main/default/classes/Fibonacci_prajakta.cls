/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-15 14:17:16
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 14:31:34
 * @ Description:print fibonacci series

 */

//print fibonacci series

public with sharing class Fobiseries {
    public void fibonacciSeries(Integer num)
    {
        Integer n1 = 0;
        Integer n2 = 1;
        Integer n3 = 0;
        
        System.debug(n1);
        System.debug(n2);
        
        for(Integer i = 0; i < num - 2; i++)
        {   
            n3 = n1 + n2;
        	n1 = n2;
            n2 = n3;
            
            System.debug(n3);
        }
    }

}
