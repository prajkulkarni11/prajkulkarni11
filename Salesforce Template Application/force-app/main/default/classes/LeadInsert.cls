/**
 * @File Name          : LeadInsert.cls
 * @Description        :  Trigger Assignment 29.Insert lead,account,contact and opportunity using the single insert statement
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 21-03-22, 2:30:39 pm
* @Modification Log   : 
**/

public with sharing class LeadInsert {
public static void display(){
    List<Sobject> li = new List<Sobject>();
    
    Account acc = new Account(Name='swapnil');
    Contact con = new Contact(FirstName='Thalal');
    Lead ld = new Lead(Company='Vyom labs');
    Opportunity opp = new Opportunity(city__c='Nagpur');

    li.add(acc);
    li.add(con);
    li.add(ld);
    li.add(opp);
    
    insert li;


}

}