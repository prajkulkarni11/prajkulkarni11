/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-18-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class RecordTypeUtility {

    /**
     * return Map of Name and ID for Record Types 
     * 
     * @return the Map in case Found Record Type otherwise is Empty Map
    */
    public static Map<String, Id> getRecordTypes(String objectName) {
        Map<String, Id> recordTypeMap = new Map<String, Id>(); 

        for (RecordType rt : [SELECT Id, Name FROM RecordType WHERE SobjectType = :objectName]) { 
            recordTypeMap.put(rt.Name, rt.Id); 
        }
        return recordTypeMap; 
    }
}
