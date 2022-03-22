public class AddAccountTeam {
    public static void addteam(list<opportunity> opplist){
        
 List<AccountTeamMember> list_atm=new List<AccountTeamMember>();
 for(Opportunity opp:opplist)
 {
 if(opp.Probability==20)
 {
 AccountTeamMember atm=new AccountTeamMember();
 atm.accountid=opp.accountid;
 atm.teamMemberRole='Account Manager';
 atm.UserId=opp.Ownerid;
 
 list_atm.add(atm);

 }
 }
 if(list_atm!=null)
 insert list_atm;

    }
}