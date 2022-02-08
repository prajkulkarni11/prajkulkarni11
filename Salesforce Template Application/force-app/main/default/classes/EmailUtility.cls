/**
 * Copyright (c) 2021, Yogesh Bhosale 
 * All rights reserved.
 * 
 *
 * @description       : EmailUtility Class expose methods for email 
 * 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class EmailUtility {

    /**
     * Validate Email and return true on correct email
     * 
     */
    public static Boolean isValidEmail(String email){
        Boolean isValid = true ;
        if (!String.isEmpty(email)){
            String emailValidatoinRegExpr = '^[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$';
            Pattern emailValidationPattern = Pattern.compile(emailValidatoinRegExpr);
            Matcher emailValidationMatcher = emailValidationPattern.matcher(email);
            if (!emailValidationMatcher.matches()){
                isValid = false;
            }
        }
        return   isValid;
    }

}