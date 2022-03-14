public class Prime {
    public void find()
    {
        integer n=45;integer flag;
        for(integer i=2;i<45;i++)
        {
            if(math.mod(n,i)==0)
            {
                flag=0;
            }
            else
            {
                flag=1;
            }
        }
        if(flag==1)
        {
            system.debug('number is prime');
        }
        else
        {
            system.debug('number is not prime');
        }
    }

}