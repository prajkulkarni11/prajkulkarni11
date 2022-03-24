/**
 * @File Name          : DynamicTreeGridController.cls
 * @Description        : Lwc Assignment:-8) Create LWC component using tree-grid to achieve below requirement.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 23/03/2022, 10:09:39 pm
 * @Modification Log   : 
 
**/

public with sharing class DynamicTreeGridController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllParentAccounts() {
        return [SELECT Name, Type FROM Account WHERE ParentId = NULL LIMIT 20];
    }

    @AuraEnabled
    public static List<Account> getChildAccounts(Id parentId) {
        return [
            SELECT Name, Type, Parent.Name
            FROM Account
            WHERE ParentId = :parentId
        ];
    }
}