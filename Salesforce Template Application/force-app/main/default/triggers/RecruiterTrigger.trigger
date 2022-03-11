/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 21:00:42
 * @ Description: //Upon Creating Hiring Manager:Copy the Record into the Recruiter Object

 */



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