trigger AccountOpportunityUpdate on Account (after update) {
    
    List<Opportunity> oppr = new list<Opportunity>();
    
    for(opportunity opp: [Select stagename, closedate, city__c from opportunity]){
    for(Account a:Trigger.new ){
       
       opp.City__c = a.City__c; 
        oppr.add(opp);
    }
     
    }   
    update oppr;
}