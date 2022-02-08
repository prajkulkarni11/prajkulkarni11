/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/

@isTest public with sharing class FileProcessorTest extends AbstractTest {

    
    @IsTest static void processNonExcelFile(){
        
        Test.startTest();
            String result = FileProcessor.processFile('abc.xls1' ,'null', null );
            System.Assert(result == '' );
        Test.stopTest();
        
    }

    @IsTest static void processExcelEmptyFile(){
        
        Test.startTest();
            String result = FileProcessor.processFile('abc.xls' ,'null', null );
            System.Assert(result == '' );
        Test.stopTest();
        
    }
    
    @IsTest static void processExcelSingleRecordFile() {
        
        Test.startTest();            
        String result = FileProcessor.processFile('abc.xls' ,'null', 'Account' );
            System.Assert(result == '' );
        Test.stopTest();
        
    }
}
