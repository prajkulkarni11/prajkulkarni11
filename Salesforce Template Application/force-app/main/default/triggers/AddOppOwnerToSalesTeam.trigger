/**

 * @File Name          : AddOppOwnerToSalesTeam.cls
 * @Description        :  Trigger Assignment 03:Write a trigger that adds the Opportunity Owner into the sales team automatically whenever the Opportunity is created.
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 15-03-22, 4:40:39 pm
* @Modification Log   : 

 **/



trigger AddOppOwnerToSalesTeam on Opportunity (after insert) {
    List<OpportunityTeamMember> listOpptyTeamMem = new List<OpportunityTeamMember>();
    
    for(Opportunity oppty : trigger.New){
        OpportunityTeamMember OTM = new OpportunityTeamMember();
        OTM.OpportunityId = oppty.Id;
        OTM.TeamMemberRole = 'Sales Rep'; 
        OTM.UserId = oppty.OwnerId;
        listOpptyTeamMem.add(OTM);             
    }
    
    if(listOpptyTeamMem.size() > 0){
        insert listOpptyTeamMem;
    }
}