/**
 * @ Author: Prajakta 
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:49:57
 * @ Description:Once the Recruiter Record has been Updated:
Sync the Changes to the Associated Hiring Manager Record.
 */



public with sharing class ChangeManager {
    public static void syncChangeToAssociate(List<Recruiter__c>newsyncist,map<id,Recruiter__c>oldmapSync){
        try{
        set<id>setid=new set<id>();
        map<id,recruiter__c>mapofrecruiter=new map<id,recruiter__c>();
        for(recruiter__c rec:newsyncist)
        {
            if(rec.Contact_Number__c!=oldmapSync.get(rec.Id).contact_number__c||rec.Location__c!=oldmapSync.get(rec.Id).location__c||rec.name!=oldmapSync.get(rec.id).name)
            {
                setid.add(rec.hiring_manager__c);
                mapofrecruiter.put(rec.hiring_manager__c,rec);

            }

        }

        list<hiring_manager__c>hrm=[select id,name,location__c,contact_number__c from hiring_manager__c where id in:setid];
        list<hiring_manager__c>updatelist=new list<hiring_manager__c>();
        for(hiring_manager__c h:hrm)
        {
            h.Name=mapofrecruiter.get(h.Id).name;
            h.location__c=mapofrecruiter.get(h.Id).location__c;
            h.contact_number__c=mapofrecruiter.get(h.Id).contact_number__c;
            updatelist.add(h);

        }
        update updatelist;
    }
        catch(Exception e){

        }
    }
}