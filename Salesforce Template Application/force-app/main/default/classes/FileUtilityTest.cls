/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
@isTest public with sharing class FileUtilityTest {
    
    @IsTest static void extensionTest(){
        
        Test.startTest();
         String result =  FileUtility.getFileExtension('Abc.doc');
        System.assert(result == 'doc');
        result =  FileUtility.getFileExtension('docxAbc.doc.txt');
        System.assert(result == 'txt');
        result =  FileUtility.getFileExtension('Abc.doctor');
        System.assert(result == 'doctor');
        result =  FileUtility.getFileExtension('Abc.yogi');
        System.assert(result == 'yogi');
        result =  FileUtility.getFileExtension('Abc');
        System.assert(result == '');
        Test.stopTest();
        
    }
}