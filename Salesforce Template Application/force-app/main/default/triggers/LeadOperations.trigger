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
trigger LeadOperations on Lead(before insert,before update) {
    
    if(trigger.isbefore&& trigger.isinsert||trigger.isupdate)
    {
        LeadOperationshelper.autoPopulateAnualRevenue(trigger.new);
    }
    
    
}