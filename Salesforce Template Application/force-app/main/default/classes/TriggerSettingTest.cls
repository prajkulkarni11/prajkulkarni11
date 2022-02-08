/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
@IsTest public with sharing class TriggerSettingTest extends AbstractTest{
    
    @IsTest static void isTriggerActiveTest(){
        
        Test.startTest();
        TriggerSetting.isTriggerActive('AccountHandler');
        Test.stopTest();
        
    }
}
