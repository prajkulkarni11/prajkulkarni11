/**
* @description       : Upon Creating Hiring Manager: Copy the Record into the Recruiter Object.

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
public with sharing class CopyRecordIntoRecruiterHelper {
    public static void copyRecord(List<Hiring_Manager__c>newAccList){
        try{
            List<Recruiter__c> rec=new List<Recruiter__c>();
            for(Hiring_Manager__c hr:newAccList)
            {
                Recruiter__c recruter=new Recruiter__c();
                recruter.Name=hr.name+'Recruiter';
                recruter.contact_number__c=hr.Contact_Number__c;
                recruter.Location__c=hr.Location__c;
                recruter.Hiring_Manager__c=hr.id;             //releting recruiter to hiring manager   
                rec.add(recruter);
            }
            if(!rec.isEmpty())
            {
                insert rec;
            }
        }catch(Exception e){
            
        }
    }
}