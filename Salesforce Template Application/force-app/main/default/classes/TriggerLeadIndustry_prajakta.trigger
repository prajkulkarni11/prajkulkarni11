/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:58:36
 * @ Description:Create a Trigger on Lead Object, to Auto Populate the Annual Revenue based on the Industry Name as below.  (TriggerLeadIndustry--LeadIndustry)
 */


trigger TriggerLeadIndustry on Lead (before insert) {

	LeadIndustry.leadUpdate(Trigger.new);
}