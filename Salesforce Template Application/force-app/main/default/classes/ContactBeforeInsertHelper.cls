/**
* @description       :  Write a trigger on contact. Scenario :- Contact have two fields 1) Name 2)
                        Gender (Male/Female) Whenever Gender is male, prefix Name with ‘Mr’ and
                        When Gender is female, prefix Name with ‘Mrs’

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class ContactBeforeInsertHelper {
    public static void updateConPrefix(List<Contact>newConList){
        for(contact con:newConList)
        {
            if(con.gender__c=='Male')
            {
                con.Lastname='Mr. '+con.Lastname;
            }
            else if(con.gender__c=='Female')
            {
                con.Lastname='Mrs. '+con.Lastname;
            }
        }
    }
    
}