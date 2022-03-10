public class FiboSeries {
    public void printSeries()
    {
        integer n1=0;
        integer n2=1;
        integer n3;
        System.debug(n1+' '+n2);
        for(integer i=2;i<20;i++)
        {
            n3=n1+n2;
            system.debug(' '+n3);
            n1=n2;
            n2=n3;
        }
    }

}