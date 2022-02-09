//Find the Second Maximum From Array
/**
* @description       : 
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Minal Patil
**/
public class SecondMaxArray {

    public integer SecondMax(){
        
        Integer[]arr = new List<Integer>{12,65,45,90,89};
            
            for(Integer num=0; num<arr.size();num++){
                
                for(Integer count=num+1; count<arr.size();count++){
                    
                    if(arr[num]>arr[count]){
                        Integer temp=arr[num];
                        arr[num]=arr[count];
                        arr[count]=temp;
                     }
                }
            }
            System.debug(arr[arr.size()-2]);
        return null;
    }
}