/**

 * @File Name          : GetDataAccount.cls
 * @Description        :Trigger Assignment 03:Write a trigger on contact. Scenario :- Contact have two fields 1) Name 2)
Gender (Male/Female) Whenever Gender is male, prefix Name with ‘Mr’ and
When Gender is female, prefix Name with ‘Mrs’

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 5:40:39 pm
* @Modification Log   : 

 **/ 

public with sharing class GetDataAccount {
    public static void getdata(List<contact> conlist){

    String gender;

        for(contact c : conlist){
            gender = c.gender__c;
            if(gender == 'Male'){
            c.Salutation = 'Mr.'; 
            }else if(gender == 'Female'){
            c.Salutation = 'Mrs.';    
            }
        }


    }
}