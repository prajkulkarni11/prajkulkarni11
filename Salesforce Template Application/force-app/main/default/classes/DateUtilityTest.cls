/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-18-2021
 * @last modified by  : Yogesh.Bhosale
**/
@isTest public with sharing class DateUtilityTest {

    
    /**
     * Test Method for parseDate 
     */
    @isTest  static void testParseDate() {
        String stringDate = '03/01/2021';
        Date result = DateUtility.parseDate(stringDate);        
        System.assert(result != null);
    }

    /**
     * Test Method for parseDate for invalid Inputs
     */
    @isTest   static void testInvalidParseDate() {
        String stringDate = '03-01-2021';
        Date result = null;
        try {
            result = DateUtility.parseDate(stringDate);        
        }catch(Exception ex){}  
 
        System.assert(result == null);
    }
     
    /**
     * Test Method for parseDateTime
     */
    @isTest static void testParseDateTime() {
        String stringDate = '03/01/2021, 11:46 AM';
        DateTime result = null;
        
        //Test valid Format Date
        result = DateUtility.parseDateTime(stringDate); 
        System.assert(result != null);

        //Test Diffrent valid Format Date
        String differntFormatDate = '03-01-2021';
        result = DateUtility.parseDateTime(DifferntFormatDate , 'DD-MM-YYYY'); 
        System.assert(result != null);

        //Test Diffrent valid Format Date
         differntFormatDate = '03-01-21';
        result = DateUtility.parseDateTime(differntFormatDate , 'DD-MM-YY'); 
        System.assert(result != null);
        
    }
    @IsTest static void getTimeBetweenDatesTest(){
        
        Test.startTest();
        DateTime startDate = DateTime.newInstance(2017, 12, 29, 20, 30, 00);
        DateTime endDate = DateTime.newInstance(2017, 12, 29, 21, 45, 00);
        Time diff =  DateUtility.getTimeBetweenDates(startDate , endDate);
        diff =  DateUtility.getTimeBetweenDates(null, null);
        Test.stopTest();
        
    }

    @IsTest
    static void getTimeBetweenTest(){
        
        Test.startTest();
        Time diff =  DateUtility.getTimeBetween(null, null);
        Test.stopTest();
        
    }
}