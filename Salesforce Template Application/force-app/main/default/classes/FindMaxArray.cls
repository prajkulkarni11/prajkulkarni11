/*Find the Maximum From Array */	
public class FindMaxArray {

    public static void MaximumEle(){
        integer[] arr=new integer[]{2,3,5,1,6};
        integer max=arr[0];
        for(integer i=0;i<arr.size();i++)
        {
            if(max<arr[i])
                max = arr[i];
        }
        system.debug(max);
    }
}