/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:54:37
 * @ Description:Upon Creating Hiring Manager:Copy the Record into the Recruiter Object

 */

//Upon Creating Hiring Manager:Copy the Record into the Recruiter Object

trigger RecruiterTrigger on HiringManager__c (after insert) 
{
	List<Recruiter__c> recList=new List<Recruiter__c>();
                for(HiringManager__c hr:trigger.new)
                {
                    Recruiter__c rec=new Recruiter__c(Name=hr.name,             
                    Rec_Contact__c=hr.Contact__c,
                    Location__c=hr.Location__c);
                    recList.add(rec);
                }
                
                    insert recList;     
          
}