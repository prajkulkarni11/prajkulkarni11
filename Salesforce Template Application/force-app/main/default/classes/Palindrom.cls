public class Palindrom 
{
    public void checkpalindrom()
    {
	integer num=212;
      integer r,sum=0,temp;  
      temp=num;    
  while(num>0){    
   r=math.mod(num,10);    
   sum=(sum*10)+r;    
   num=num/10;    
  }    
  if(temp==sum) 
  {
   System.debug('palindrome number');
  }
  else    
   System.debug('not palindrome');    
}
}