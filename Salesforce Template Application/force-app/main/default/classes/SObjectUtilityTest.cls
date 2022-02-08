/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-12-2021
 * @last modified by  : Yogesh.Bhosale
**/

@isTest public with sharing class SObjectUtilityTest extends AbstractTest {

    @IsTest static void getAllFieldTest() {

        List<String> allFields = SObjectUtility.getAllFieldsForSObject('Account');
        Integer standerdFieldCount = allFields.size() ;
        System.Assert(standerdFieldCount > 20);
        //try with null SOBJECT
        try{
            allFields = SObjectUtility.getAllFieldsForSObject(null);
        }catch(Exception ex){}
        
    }


    @IsTest static void getFieldTypeTest() {

        String result = SObjectUtility.getFieldType('Account','name');
        System.Assert(result == 'STRING');

        result = SObjectUtility.getFieldType('Account','lastActivityDate');
        System.Assert(result == 'DATE');
        result = SObjectUtility.getFieldType('Account','createdDate');
        System.Assert(result == 'DATETIME');
        result = SObjectUtility.getFieldType('Account','NumberOfEmployees');
        System.Assert(result == 'NUMBER');
        result = SObjectUtility.getFieldType('Account','AnnualRevenue');
        System.Assert(result == 'CURRENCY');

        result = SObjectUtility.getFieldType('Account','Industry');
        System.Assert(result == 'STRING');
        result = SObjectUtility.getFieldType('Account','Description');
        System.Assert(result == 'STRING');

        //Negative Tests
        try { 
            result = SObjectUtility.getFieldType('Account',null);
        }catch(Exception ex){}
        try { 
            result = SObjectUtility.getFieldType(null,'name');
        }catch(Exception ex){}

    }
    @IsTest static void getAllFieldsInSOQLSelectTest() {
        String result = null;
        try{
            result = SObjectUtility.getAllFieldsInSOQLSelect(null);
        }catch(Exception ex) {}
         
         result = SObjectUtility.getAllFieldsInSOQLSelect('Account');
        System.Assert(result != null);
    }
    @IsTest static void getObjectNameFromLabelTest() {

        String result =  SObjectUtility.getObjectNameFromLabel('Account1');
        System.Assert(result == null);
        result =  SObjectUtility.getObjectNameFromLabel('Account');
        System.Assert(result == 'Account');
    }

    @IsTest static void abstractTest() {
        SObjectUtilityTest tester = new SObjectUtilityTest();
        User currentUser = tester.getCurrentUser();
        System.Assert(currentUser != null);

        User adminUser = tester.getSysAdminUser();
        System.Assert(adminUser != null);
    }

    @IsTest static void newInstanceTest() {
        Test.startTest();
        SObject objectSO = SObjectUtility.newInstance('Account');
        
        System.assert( objectSO != null );
        Test.stopTest();
    }
    /**
    * @description Test newInstance With Invalid Object Name
    * @author Yogesh.Bhosale | 12-12-2021 
    **/
    @IsTest static void newInstanceOfInvalidNameTest() {
        Test.startTest();
        try{
             SObjectUtility.newInstance('Yogesh');
        }catch(Exception ex) {
            logUtility.logMessage('No Object Found ');
        }

        try{
             SObjectUtility.newInstance(null);
        }catch(Exception ex) {
            logUtility.logMessage('No Object Found ');
        }

        Test.stopTest();
    }
    @IsTest static void createSObjectTest(){
        
        Test.startTest();
        SObject objectSo =  SObjectUtility.createSObject('null');
        System.assert( objectSo == null);
        Test.stopTest();
        
    }

    @IsTest static void createSObjectWithCorrectDataTest(){
        
        Test.startTest();
        String inputRecord = '{"rowNumber":"1" ,"objectName" :"Account" }';
        SObject objectSo =  SObjectUtility.createSObject(inputRecord);
        System.assert( objectSo != null);
        Test.stopTest();
        
    }
    @IsTest static void createSObjectWithEmptyAttributesTest(){
        
        Test.startTest();
        String inputRecord = '{"rowNumber":"1" ,"objectName" :"Account" ,"objectData" :[]  }';
        SObject objectSo =  SObjectUtility.createSObject(inputRecord);
        System.assert( objectSo != null);
        Test.stopTest();
        
    }

    @IsTest static void createSObjectWithaAttributesTest(){
        
        Test.startTest();
        String inputRecord = '{"rowNumber":"1" ,"objectName" :"Account" ,"objectData" :[ {"fieldName":"name" ,"fieldValue":"Yogesh"}]  }';
        SObject objectSo =  SObjectUtility.createSObject(inputRecord);
        System.assert( objectSo != null);
        System.assert( objectSo.get('name') != null);
        Test.stopTest();
        
    } 

    @IsTest static void createSObjectWithAttributesTest(){
        
        Test.startTest();
        String inputRecord = '{"rowNumber":"1" ,"objectName" :"Account" ,"objectData" :[ '+
                                '{ "fieldName":"name" , "fieldValue":"Yogesh"} , '+
                                '{ "fieldName":"test",  "fieldValue": "invalid col"}, '+
                                '{ "fieldName":"AnnualRevenue", "fieldValue":"100"} ,'+
                                '{ "fieldName":"personBirthDate", "fieldValue":"01/01/2021"} ,'+
                                '{ "fieldName":"Phone", "fieldValue":"100"} ,'+
                                '{ "fieldName":"NumberOfEmployees", "fieldValue":"100"} ,'+
                                '{ "fieldName":"website", "fieldValue":"http://www.yogesh.com"} ,'+
                                '{ "fieldName":"IsCutomerPortal", "fieldValue":"0"} ,'+
                                '{ "fieldName":"NumberOfEmployees", "fieldValue":"100"} ,'+
                                '{ "fieldName":"Description", "fieldValue":"Sample Account"} ,'+
                                '{ "fieldName":"Industry","fieldValue": "Technology" }'+
                             ']  }';
        SObject objectSo =  SObjectUtility.createSObject(inputRecord);
        System.assert( objectSo != null);
        System.assert( objectSo.get('name') != null);
        Test.stopTest();
        
    }     
}
