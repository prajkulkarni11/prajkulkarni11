/**
 * @description       : 
 *      String Utility class for the string utility menthods. 
 * 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-02-2022
 * @last modified by  : Yogesh.Bhosale
 * 
 * @2009-2019 Vyomlabs private limited All rights reserved.
**/

public with sharing class StringUtility {


    public static boolean isValidId(String key) {
        Boolean isValid = false ;
        try {
            if ( Pattern.compile( '[a-zA-Z0-9]{15}|[a-zA-Z0-9]{18}' ).matcher( key ).matches() ){
                    
                // If the tests passed, it's valid
                isValid = true;
            }
        } catch ( Exception e ){
            // StringException, TypeException
        }

        return isValid;
    }
     
    
    /**
     *  check if the ID is Correct Salesforce ID in Current ORG check if this Object Exist 
     *  
     */
    public static boolean isValidAndExists(String key) {
        Map<String, Schema.SObjectType> objTypes = Schema.getGlobalDescribe();
        Boolean isValid = false ;
        for (Schema.SObjectType objType : objTypes.values()) {
            Schema.DescribeSObjectResult objDesc = objType.getDescribe();
            if (objDesc.getKeyPrefix() == key.substring(0,3)) {
                String objName = objDesc.getName();
                String query = 'SELECT Id FROM ' + objName + ' WHERE Id = \'' + key + '\'';
                SObject[] objs = Database.query(query);
                isValid =  !objs.isEmpty();
            }
        }
        return isValid;

    }

    /**
     * Check if String is part of another String ignoring the Case
     * 
     * @return true in case searchStr Contains 
     */
    public static Boolean containsIgnoreCase(String str, String searchStr) { 
        // ensure the main string is not null 
        if (str == null) { 
            return false; 
        }

        // we actually have something to search for
        if (searchStr == null) { 
            return false;
        }

        // Lowercase the str and searchStr and check it 
        return str.toLowerCase().contains(searchStr.toLowerCase()); 
    }
}