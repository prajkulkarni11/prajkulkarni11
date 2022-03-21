trigger Trigger11Ex on Opportunity (after insert,after update) {

   if(trigger.isafter && trigger.isupdate)
   {
       AddAccountTeam.addteam(trigger.new);
   }
}