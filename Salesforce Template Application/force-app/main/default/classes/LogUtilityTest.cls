/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/
@isTest public with sharing class LogUtilityTest {

    @IsTest static void logTest(){
        List<Object> values = new List<Object>();
        values.add('Yogesh');
        values.add('Inteligent');

        LogUtility.debug('Here is {0} and I am Not {1} ' , values);
        logUtility.debug('Test message');
        logUtility.debug(values);

        LogUtility.error('Here is {0} and I am Not {1} ' , values);
        logUtility.error('Test message');
        logUtility.error(values);

        logUtility.logMessage('Message');
        LogUtility.logMessage('message' ,LoggingLevel.INFO);
        LogUtility.logMessage('Here is {0} and I am Not {1} ' , values ,LoggingLevel.INFO);
    }
}
