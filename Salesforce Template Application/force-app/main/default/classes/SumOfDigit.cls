public class SumOfDigit {
    public void addDigit()
    {
        integer num=436,sum,digit;
        while(num > 0) 
        {
        digit = math.mod(num,10);  
  		sum = sum + digit;  
		num = num / 10;  
} 
        system.debug('sum of digits in number'+sum);
    }

}