//Find the Maximum From Array
/**
* @description       : 
* @author            : Minal Patil
* @group             : 
* @last modified on  : 02-07-2022
* @last modified by  : Minal Patil
**/
public class MaxArray {
   
    public integer max(){
        List<Integer> List1 = new List<Integer>();
			List1.add(55);
			List1.add(75);
			List1.add(99);
			Integer maxvalue = List1[0];
        		For (integer num =0; num<List1.size();num++)
        		{
            
            		if( List1[num] > maxvalue)
                	maxvalue = List1[num];             
        		}    
			system.debug('the max value is'+maxvalue);  
            return null;
   		 }

	
}