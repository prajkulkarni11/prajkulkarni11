//Find third maximum number from array
public class ThirdMax {
    public void findThirdMax()
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
        integer j=arr.size()-3;
            system.debug(arr[j]);
     
        
    }

}