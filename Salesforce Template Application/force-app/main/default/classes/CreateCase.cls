
/**
 * @File Name          : CreateCase.cls
 * @Description        : Collection Assignment 7) Create lightning component to achieve below requirement (License Application)

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 22/03/2022, 7:40:39 pm
 * @Modification Log   : 
 
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