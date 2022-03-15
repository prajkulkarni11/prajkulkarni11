/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:54:02
 * @ Description:Create a Trigger on Lead Object, to Auto Populate the Annual Revenue based on the Industry Name as below. 
 */

//7.	Create a Trigger on Lead Object, to Auto Populate the Annual Revenue based on the Industry Name as below.  


public with sharing class LeadIndustry
{
	public static void leadUpdate(list<lead>led)
	{
        for(lead l : led){
            
            if(l.Industry == 'Banking'){
                l.AnnualRevenue=900000;
            }
           else if(l.Industry == 'Finance'){
                l.AnnualRevenue=7600000;
            }
            else if(l.Industry == 'Insurance'){
                l.AnnualRevenue=4500000;
            }
            else if(l.Industry == ' Manufacturing'){
                l.AnnualRevenue=8400000;
            }
            else if(l.Industry == 'Education'){
                l.AnnualRevenue=7400000;
            }
            else if(l.Industry == 'Consulting'){
                l.AnnualRevenue=3200000;
            }
             else if(l.Industry == 'Energy '){
                l.AnnualRevenue=9400000;
            }
}
}
}