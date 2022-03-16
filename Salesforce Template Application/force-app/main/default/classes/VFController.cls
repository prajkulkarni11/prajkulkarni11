/**

 * @File Name          : VFController.cls
 * @Description        :  VF Assignment 05:i want to refresh vf page after every 20 or 30 secs what should be done
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 14-03-22, 2:40:39 pm
* @Modification Log   : 

 **/

public with sharing class VFController {
    
    Integer count = 0;
    
    public PageReference incrementCounter() {
        count++;
        return null;
    }
    public Integer getCount() {
        return count;
    }

    
}