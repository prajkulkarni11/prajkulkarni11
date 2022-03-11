/**
* @description       : Once the Hiring Manager Record has been Updated:Sync the Changes into the Associated Child Record.
* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class SyncChangestoChildRecordsHelper {
    public static void syncChange(List<Hiring_Manager__c>newsyncist,map<id,Hiring_Manager__c>oldmapSync){
        try{
        Set<id> hid=new Set<id>();
        for(Hiring_Manager__c h:newsyncist)
        {
            if(h.name!=oldmapSync.get(h.id).name || h.Contact_number__c!=oldmapSync.get(h.id).Contact_number__c||h.Location__c!=oldmapSync.get(h.id).Location__c)
            {
                hid.add(h.id);   
            }
        }
        list<Recruiter__c> r=[select id,name,Contact_Number__c,Location__c,Hiring_Manager__c,Hiring_Manager__r.Contact_number__c,Hiring_Manager__r.Name,Hiring_Manager__r.Location__c from Recruiter__c where Hiring_Manager__c in:hid];
        for(Recruiter__c obj:r)
        {
            obj.name=obj.Hiring_Manager__r.name+'Recruiter';
            obj.Location__c=obj.hiring_manager__r.Location__c;
            obj.Contact_Number__c=obj.Hiring_Manager__r.Contact_number__c;
        }
        update r;
        }catch(Exception e){
            
        }
    }
}