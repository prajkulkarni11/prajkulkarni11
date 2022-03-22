/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\trigger8.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 11:50:24 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger trigger8 on Contact (after insert) {

    
    if( trigger.isInsert ||  trigger.isUpdate )
        {
    for( Contact c : trigger.new )
    {
        if(c.Contact_Relationship__c == true ){
            Contact_Relationship__c rel = new Contact_Relationship__c();
            rel.Contact__c = c.id;
            rel.Name = c.LastName + 'R';
            insert rel;
        }
           
        }
    }
    
    
}