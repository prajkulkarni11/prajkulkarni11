//find maximum number from an array
public class MaxInArray {
    public void findMax()
    {
    integer [] arr=new integer[]{6,8,4,2,6};
        integer max=arr[0];
           for(integer i=0;i<arr.size();i++)
    {
        if(arr[i]>max)
        {
            max=arr[i];
        }
    }
        system.debug('max from an array'+max);
        }
}