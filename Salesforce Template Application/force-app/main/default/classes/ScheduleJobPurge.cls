
/**

 * @File Name          : ScheduleJobPurge.cls
 * @Description        :Asynchronous Apex Assignment 04:Create a Schedule Job, To Purge All the Position Records, whose MileStone Date is Over. Schedule the Job to be get run on EveryDay morning @ 2.00 AM. 

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 2:40:39 pm
* @Modification Log   : 

 **/ 

public with sharing class ScheduleJobPurge implements schedulable{
    
    public void execute(schedulablecontext sc){
        
        List<Position__c> p = new List<Position__c>();
        
        if(p!=null) {
            
            p = [select id from Position__c where milestone__c <=:System.today()];
            
            delete p;
            
        }
    }
    
}