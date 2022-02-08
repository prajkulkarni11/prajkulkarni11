/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/

@IsTest public with sharing class RecordTypeUtilityTest {

    @IsTest static void getRecordTypesTest() {
        Map<String, Id> recordTypeMap  = RecordTypeUtility.getRecordTypes('Account' );
    }
 
}
