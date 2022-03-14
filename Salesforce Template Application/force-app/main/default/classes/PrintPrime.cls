public class PrintPrime {
    public void printnumber()
    {
         integer i, a = 1, count; 
  

  while(a <= 90)
  {
    count = 0;
    i = 2;
    while(i <= a/2)
    {
      if(math.mod(a,i) == 0)
      {
        count++;
	break;
      }
      i++;	
    }	
    if(count == 0 && a != 1 )
    {
	System.debug(' '+a);
    }
    a++; 
  }
}
}