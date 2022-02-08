/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-28-2021
 * @last modified by  : Yogesh.Bhosale
**/
@isTest  with sharing class CalendarServiceTest {

    @IsTest static void fetchEventTest(){
        
        Test.startTest();
            CalendarService.fetchAllEvents();
            
        Test.stopTest();
        
    }
}
