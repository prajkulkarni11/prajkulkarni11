/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 12:42:45
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 12:48:05
 * @ Description:Create a Schedule Job, To Purge All the Position Records, whose MileStone Date is Over. Schedule the Job to be get run on EveryDay morning @ 2.00 AM. 

 */

//4.	Create a Schedule Job, To Purge All the Position Records, whose MileStone Date is Over. Schedule the Job to be get run on EveryDay morning @ 2.00 AM. 


Global with sharing class SchedulePositionMildstone implements schedulable 
{
    global void execute(SchedulableContext sc)
	{
		List<Position__c> poslist=new List<Position__c>();
		List<Position__c> plist=[select id,name,Close_Date__c from Position__c];

		for(Position__c p:plist)
		{
			if(p.Close_Date__c<system.today())
			{
                poslist.add(p);
            }
		}
        delete poslist;
	}
}