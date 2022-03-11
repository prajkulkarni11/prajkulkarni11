/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:10
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:04:39
 * @ Description:3.	Write a trigger on contact. Scenario :- Contact have two fields 1) Name 2)
Gender (Male/Female) Whenever Gender is male, prefix Name with ‘Mr’ and
When Gender is female, prefix Name with ‘Mrs’
 */


public with sharing class UpdateContactGender 
{
	 public static void updateGender(list<contact>con){
        for(contact c : con){
            system.debug('trigger='+trigger.new);
            if(c.Ge__c=='male'){                             
                c.salutation = 'Mr.';                
            }
            
            else if(c.Ge__c=='Female')
            {
                c.salutation='Mrs.';
            }                 
        }
    }
}