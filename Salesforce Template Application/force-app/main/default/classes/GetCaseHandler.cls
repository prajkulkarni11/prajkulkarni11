/*
 * Filename: e:\LWC ass Pooja mam\DemoProject\force-app\main\default\classes\GetCaseHandler.cls
 * Path: e:\LWC ass Pooja mam\DemoProject
 * Created Date: Wednesday, March 16th 2022, 12:31:52 pm
 * Author: snehal@vyomlabs.com
 * 
 * Copyright (c) 2022 Your Company
 */

public with sharing class GetCaseHandler {


    @AuraEnabled(cacheable=false)
    public static list<Case> getcaselist(string caseSearchkey){
        string searchKey ='%'+caseSearchkey+'%';
        System.debug(searchKey);
        return [select CaseNumber,Origin,Subject,Description,ClosedDate,CreatedDate,Status from Case where CaseNumber LIKE :searchKey 
        WITH SECURITY_ENFORCED LIMIT 10];
       
    }
   
}