/**
* @Class Name        : FindTestInObjectsD3e4
* @description       : Finding Particular Text on multiple objects using SOSL
* @author            : Girish
**/
public with sharing class FindTestInObjectsD3e4 {
    public static void main(){
        List<list<SObject>> acc = new List<list<sobject>>();
        acc= [Find 'Girish' in Name Fields Returning Account(name), Opportunity(Name), Lead(Name)];
        System.debug('Accounts '+acc[0]);
        System.debug('Opportunities '+acc[1]);
        System.debug('Leads '+acc[2]);
        System.debug('All '+acc); 
          
    }
}