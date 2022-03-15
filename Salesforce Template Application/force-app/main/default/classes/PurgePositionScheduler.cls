/*@class : PurgePositionScheduler
 * @description : Shedule job to purge at 2am
 * @author : Girish
*/
Global with sharing class PurgePositionScheduler implements system.Schedulable {
    
    global void execute(Schedulablecontext sc){
        List<Position__c> positiondeleteList = new List <Position__c>();
        List<Position__C> posList = [select id,milestone_date__c from position__C];
        
        for(Position__c p : poslist){
            if(p.milestone_date__c<system.today()){
                positiondeleteList.add(p);
            }
        }
        try{ 
            if(!positiondeleteList.isEmpty())
               delete positiondeleteList;  
            }
        catch(DMLException e){
            system.debug('error message '+e.getMessage());
        }
    }

}