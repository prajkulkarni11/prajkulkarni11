/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/
@isTest public with sharing class EmailUtilityTest {


    @IsTest static void validateEmailAddress(){
        
        Test.startTest();
            Boolean result = EmailUtility.isValidEmail('ybbhosale@gmail.com');
            System.Assert(result ,true);
            result = EmailUtility.isValidEmail('a@gmail.com');
            System.Assert(result ,true);
            result = EmailUtility.isValidEmail('ybbhosale@.com');
            System.Assert(result == false);
            result = EmailUtility.isValidEmail('ybbhosale@gmail');
            System.Assert(result == false);
        Test.stopTest();
        
    }
}
