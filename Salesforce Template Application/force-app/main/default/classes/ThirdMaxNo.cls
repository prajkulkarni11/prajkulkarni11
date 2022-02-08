/*
    Find the Third Max No from Array
 */
public class ThirdMaxNo {
    public void thirdMax(){
        integer[] arr= new integer[]{3,2,6,9,1};
            
            integer first=0;
            integer second=0;
        	integer third=0;
        
        for(integer i=0; i<arr.size(); i++){
            if(arr[i]>first)
            {
                third=second;
                second=first;
                first=arr[i];
            }
            
            else if(arr[i]>second && arr[i]!=first)
            {
                second=arr[i];
            }
            
            else if(arr[i]>third && arr[i]!=second)
            {
                third=arr[i];
            }
        }
        system.debug(third);
    }

}