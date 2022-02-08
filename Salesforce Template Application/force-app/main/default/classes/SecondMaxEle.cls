/*Find the Second Maximum From Array */
public class SecondMaxEle {
    public static void MaximumSecEle()
    {
    		integer[] arr=new integer[]{2,3,5,1,6};
         	integer temp=0;
        for(integer j=0;j<arr.size();j++)
        {
            for(integer i=j+1;i<arr.size();i++)
            {
                if(arr[j]<arr[i])
                {
                            temp=arr[j];
                            arr[j]=arr[i];
                            arr[i]=temp;
                }
            }
        }
             system.debug('Second largest ele is '+arr[1]);
    }
}