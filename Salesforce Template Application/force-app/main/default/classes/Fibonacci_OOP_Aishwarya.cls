//print fibonacci series

public with sharing class Fibonacci
{
    integer n1=0,n2=1,n3,i;   
    public void display(integer num)
    {
        system.debug(''+ n1);
        system.debug(''+ n2);  
        for(i=2;i<num;++i)  //loop starts from 2 because 0 and 1 are already printed    
        {    
            n3=n1+n2;    
            system.debug(''+n3);    
            n1=n2;    
            n2=n3;    
        }  
    }
}

//Fibonacci f = new Fibonacci();
//f.display(10);