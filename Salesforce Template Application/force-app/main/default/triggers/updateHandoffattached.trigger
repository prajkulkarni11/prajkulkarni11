
/**
 * @File Name          : updateHandoffattached.Trigger
 * @Description        :  Trigger Assignment 01:Create “Top X Designation” custom object which is the related list to Opportunity (Look up Relationship). In the Top X Designation object, create the fields Type (Picklist),Document Attached (Checkbox)
Create one field Handoff Attached with pick list type with values are Yes, No on Opportunity Object.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 17-03-22, 2:40:39 pm
* @Modification Log   : 
 **/

trigger updateHandoffattached on Top_X_Designation__c (after insert,After Update) {
    set<id> setid = new set<id>();
    map<id,Opportunity> mapopp = new map<id,Opportunity>();
    list<Opportunity> opplist = new list<Opportunity>();
    
    for(Top_X_Designation__c top:Trigger.new){
        if(top.Document_Attached__c == true &&
           ((top.Type__c=='Contract Flow Down') || (top.Type__c=='Handoff')) && top.Opportunity__c!=null){
               
               setid.add(top.Opportunity__c);
           }
    }
    
    if(setid.size()>0){
        for(Opportunity op:[select id,Handoff_Attached__c from opportunity where id IN :setid ]){
            op.Handoff_Attached__c = 'yes';
            opplist.add(op);
            
        }
    }
    
    if(opplist.size()>0){
        update opplist;
    }
}