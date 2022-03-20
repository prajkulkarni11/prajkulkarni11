
/**
 * @File Name          : CountAttachmentt.trigger
 * @Description        :  Trigger Assignment 12:Build solution to show count of number of Attachment (Classic +Lightening) on record detail page (Create custom filed to store count). Count should get updated on the basis of delete /Insert.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 4:50:39 pm
* @Modification Log   : 
 **/

trigger CountAttachmentt on Attachment (after insert,after update,after delete,after undelete) {
    Map<Id,List<Attachment>> parent = new Map<Id,List<Attachment>>();
    set<id> attids = new set<id>();
    
    if(Trigger.new <> null){
        for(Attachment c:Trigger.new){
            if(c.ParentId != null)
                attids.add(c.parentid);
        }
    }
    else if(Trigger.old != null){
        for(Attachment c:Trigger.old){
            if(c.ParentId<>null)      
                attids.add(Trigger.oldMap.get(c.id).parentid);
        }
    }
    if(attids.size()>0){
        try{
            List<Attachment> a = new List<Attachment>([select id,parentid from Attachment where parentid IN:attids]);
            Map<id,Opportunity> testmap = new Map<id,Opportunity>([select id,Count_Atachment__c from Opportunity where id IN: attids]);
            
            for(Attachment at: a){
                List<Attachment> llist = new List<Attachment>();
                if(parent.get(at.parentid) == null){
                    llist.add(at);
                    parent.put(at.parentid,llist);
                }else if(parent.get(at.parentid) != null){
                    llist = parent.get(at.parentid);
                    llist.add(at);
                    parent.put(at.parentid,llist);
                }
            }
            
            for(Id i: attids){
                if(testmap.get(i) != null && parent.get(i) != null){ 
                    testmap.get(i).Count_Atachment__c = parent.size();
                    
                }else if(testmap.get(i) != null && parent.get(i) == null){
                    testmap.get(i).Count_Atachment__c = 0; 
                }
            }
            
            update testmap.values();
            System.Debug(testmap.values());
        }catch(Exception e){}
    }
}