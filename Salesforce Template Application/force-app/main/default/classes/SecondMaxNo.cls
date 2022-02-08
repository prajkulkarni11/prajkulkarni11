/*
 Find Second Max No From Array
*/
public class SecondMaxNo {

    public void secondMax(){
        integer[] arr= new integer[]{3,2,6,9,1};
         
            integer first= 0;
        integer second= 0;
        
        for(integer i=0; i<arr.size(); i++){
            if(arr[i]>first)
            {
                second=first;
                first=arr[i];
            }
            
            else if(arr[i]>second && arr[i]!=first)
            {
                second=arr[i];
            }
        }
           system.debug(second); 
    }
}