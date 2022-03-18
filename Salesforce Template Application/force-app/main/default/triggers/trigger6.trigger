/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigger6.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigger6 on Customer_project__c (after insert) {

      Set<id> oppidset = new Set<id>();
   
      for(Customer_Project__c cp : Trigger.new){    
           if(cp.Status__c=='Active')
           {                      
                     oppidset.add(cp.id);
           } 
    }
   List<Opportunity> opplist = [select id, Name,Active_Customer_project__c from Opportunity where id in :oppidset];
   for(Opportunity o :opplist){
           o.Active_Customer_project__c=true;
        opplist.add(o);  
    }
    update opplist;
   
}