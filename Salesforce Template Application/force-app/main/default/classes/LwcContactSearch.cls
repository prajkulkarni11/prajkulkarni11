

/**
 * @File Name          : LwcContactSearch.cls
 * @Description        : 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 28/02/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class LwcContactSearch {
    public LwcContactSearch() {}
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchCon(String conSearchKey){
        String searchKey= '%' + conSearchKey +'%';
        
        return [select id,firstName, LastName, Email from Contact WHERE name LIKE:searchKey];
    }
    
}