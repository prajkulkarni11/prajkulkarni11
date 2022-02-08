/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-20-2021
 * @last modified by  : Yogesh.Bhosale
**/

@isTest public with sharing class SObjectMetadataTest {
    
    @IsTest static void ValidObjectTest(){
        
        Test.startTest();
        SObjectMetadata metadata = new SObjectMetadata('Contact');
        String fieldApiName = metadata.getFieldApiNameFromLabel('First Name');
        System.assert(fieldApiName == 'FIRSTNAME' );
        Test.stopTest();
        
    } 


    @IsTest static void getFieldTest(){
        
        Test.startTest();
        SObjectMetadata metadata = new SObjectMetadata('Contact');
        String fieldApiName = metadata.getField('FirstName');
        System.assert(fieldApiName == 'FirstName' );
        Test.stopTest();
        
    } 

    @IsTest static void getFieldTypeTest(){
        
        Test.startTest();
        SObjectMetadata metadata = new SObjectMetadata('Contact');
        String result = metadata.getFieldType('FirstName');
        System.assert(result == 'STRING' );
        Test.stopTest();
        
    } 
}
