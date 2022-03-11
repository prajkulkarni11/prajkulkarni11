/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 17:26:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 20:59:54
 * @ Description:7.	Create a Trigger on Lead Object, to Auto Populate the Annual Revenue
 *  based on the Industry Name as below.  
 */


trigger TriggerLeadIndustry on Lead (before insert)
 {

	LeadIndustry.leadUpdate(Trigger.new);
}