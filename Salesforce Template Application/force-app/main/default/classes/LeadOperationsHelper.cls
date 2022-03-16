/**
* @description       : Create a Trigger on Lead Object, to Auto Populate the Annual Revenue based on the Industry Name as below:
Industry Name                        AnnualRevenue
---------------------------------------------------
Banking                                 90,00,000
Finance                                 76,00,000
Insurance                               45,00,000
Manufacturing                           84,00,000
Education                               74,00,000
Consulting                              32,00,000
Energy                                  94,00,000


* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class LeadOperationsHelper {
    public static void autoPopulateAnualRevenue(List<Lead> leadList)   {
        for(Lead l:leadList)
        {
            if(l.Industry!=null)
            {
                if(l.Industry=='Banking')
                    l.AnnualRevenue=9000000;
                else if(l.Industry=='Finance')
                    l.AnnualRevenue=7600000;
                else if(l.Industry=='Insurance')
                    l.AnnualRevenue=4500000;
                else if(l.Industry=='Manufacturing')
                    l.AnnualRevenue=8400000;
                else if(l.Industry=='Education')
                    l.AnnualRevenue=7400000;
                else if(l.Industry=='Consulting')
                    l.AnnualRevenue=3200000;
                else if(l.Industry=='Energy')
                    l.AnnualRevenue=9400000;
                else
                    l.AnnualRevenue=0;
            }
        }
    }
    
}