trigger AddOppSalesTeam on Opportunity (before insert) {
if(trigger.isBefore && trigger.isInsert)
{
    AddOppTeamMember.addopp(trigger.new);
}
}