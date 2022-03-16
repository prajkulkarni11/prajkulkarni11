/**
* @description       :  Write a trigger on contact. Scenario :- Contact have two fields 1) Name 2)
                        Gender (Male/Female) Whenever Gender is male, prefix Name with ‘Mr’ and
                        When Gender is female, prefix Name with ‘Mrs’

* @author            : Amar Giram
* @group             : 
* @last modified on  : 07-03-2022
* @last modified by  : Amar Giram
**/
Trigger ContactBeforeInsert on Contact (before insert) {
    if(trigger.isBefore){
        ContactBeforeInsertHelper.updateConPrefix(trigger.new);
    } 
   
}