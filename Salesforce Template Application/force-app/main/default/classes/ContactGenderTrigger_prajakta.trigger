/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 17:47:35
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 17:51:46
 * @ Description:Write a trigger on contact. Scenario :- Contact have two fields 1) Name 2)
Gender (Male/Female) Whenever Gender is male, prefix Name with ‘Mr’ and
When Gender is female, prefix Name with ‘Mrs'.
 */

trigger ContactGenderTrigger on Contact (before insert,Before update)
{
    UpdateContactGender.updateGender(Trigger.new);

}