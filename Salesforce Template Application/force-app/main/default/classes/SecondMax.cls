//find second maximum number from an array
public class SecondMax {
    public void findSecondMax()
    {
    integer [] arr= new integer[]{50,9,64,7,12,41,32};
      for(integer i=0;i<arr.size();i++)
        {
            for(integer j=1;j<arr.size();j++)
            {
                if(arr[i]<arr[j])
            {
                integer temp;
                temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
              
            }
            }
            
        }
        integer j=arr.size()-2;
            system.debug(arr[j]);
     
        
    }
}