/**
* @class             : ScheduleJob.cls 
* @description       : Create a Schedule Job, To Purge All the Position Records, whose MileStone Date is Over. Schedule the Job to be get run on EveryDay morning @ 2.00 AM.
* @author            : Amar Giram
* @group             : 
* @last modified on  : 08-03-2022
* @last modified by  : Amar Giram
**/
global with sharing class ScheduleJob implements schedulable {
    
    global void execute(SchedulableContext sc)
    {
        List<Position__c> positiontodeleteList=new List<Position__c>();
        List<Position__c> posList=[select id,milestone_date__c from Position__c];
        
        for(Position__c p:posList)
        {
            if(p.milestone_date__c<system.today())
            {
                positiontodeleteList.add(p);
            }
        }
        try{
            if(!positiontodeleteList.isEmpty())
            delete positiontodeleteList;
        }
        catch(DMLException e){
            system.debug(e.getMessage());
        }
        
    }
    

}