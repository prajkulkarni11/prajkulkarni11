
/**
 * @description       : Apex Assignment
 * @author            : Swapnil Thalal
 * @group             : 
 * @last modified on  : 02-03-22
 * @last modified by  : Swapnil Thalal
**/

public with sharing class CreateCase {
    public CreateCase() {

    }
    @AuraEnabled(cacheable=true) 
    public static void createCaseNew(String fname){

        Case clist=new Case();
        clist.Status='Working';
         clist.Origin='Web';
         clist.Subject='Liscense Application:' + fname;

         insert clist;

    }


}