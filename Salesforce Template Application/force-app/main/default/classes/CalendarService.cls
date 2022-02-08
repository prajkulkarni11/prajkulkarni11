/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-28-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class CalendarService {

    /**
     * Generic Implementation
     * 
     */
    @AuraEnabled
    public static List<Event> fetchAllEvents(){
        List<Event> eventList = new List<Event>();
        eventList = [Select Id, Subject, WhatId, WhoId, 
                    Description, EndDate, EndDateTime, OwnerId,
                    ActivityDate, ActivityDateTime From Event LIMIT 100];
        return eventList;
    }
}
