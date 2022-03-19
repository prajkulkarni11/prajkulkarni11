public class AddOppTeamMember {
public static void addopp(list<Opportunity> opplist)
{
    list<OpportunityTeamMember> optlist = new list<OpportunityTeamMember>(); 
    for(Opportunity opp:opplist)
    {
        OpportunityTeamMember oppt = new OpportunityTeamMember();
        //oppt.Name=opp.OwnerId.name;
         oppt.OpportunityId = opp.Id;
 oppt.UserId = opp.OwnerId;
 oppt.TeamMemberRole = 'Account Manager';
        optlist.add(oppt);
    }
    insert optlist;
}
}