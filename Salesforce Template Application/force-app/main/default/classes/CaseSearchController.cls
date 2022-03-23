/**
 * @File Name          : CaseSearchController.cls
 * @Description        : Lwc Assignment:-5) Custom Search to include line-item records:
•	Create custom lightning component which contains search box.

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 23/03/2022, 9:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class CaseSearchController {
    public CaseSearchController() {

    }

    @AuraEnabled
    public static List<Case> caselist(String casesearchkey){
        String searchKey='%'+casesearchkey+'%';

        List<case> cases=[SELECT id, Subject,CaseNumber,Description,	ClosedDate,	CreatedDate,Status, 
          
        Product__c FROM Case WHERE Product__c LIKE:searchKey LIMIT 10];

          return cases;
    }
}