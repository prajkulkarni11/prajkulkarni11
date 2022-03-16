
/**

 * @File Name          : AutoPopulate.cls
 * @Description        : Trigger Assignment 07:Create a Trigger on Lead Object, to Auto Populate the Annual Revenue based on the Industry Name as below.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 1:40:39 pm
* @Modification Log   : 

 **/

public with sharing class AutoPopulate {
    
    public static void getdata(List<Lead> leadlist){

        String industry;

        for(lead l: leadlist){
            industry = l.Industry;
            if(industry == 'Banking'){
            l.AnnualRevenue = 7000000;    
            }else if(industry == 'Finance'){
            l.AnnualRevenue = 5600000;    
            }else if(industry == 'Insurance'){
            l.AnnualRevenue = 6700000;    
            }else if(industry == 'Manufacturing'){
            l.AnnualRevenue = 9700000;    
            }else if(industry == 'Education'){
            l.AnnualRevenue = 4500000;    
            } 
        }
    }

}