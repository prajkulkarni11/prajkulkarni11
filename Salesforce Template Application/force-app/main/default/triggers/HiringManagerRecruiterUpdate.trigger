trigger HiringManagerRecruiterUpdate on Hiring_Manager__c (after insert, after update) {
	list<Recruiter__c> rl = new List<Recruiter__c>();
    for(Hiring_Manager__C hr: trigger.new){
        Recruiter__c r = new Recruiter__c();
        r.name = hr.name;
        r.Hiring_Manager__c = hr.id;
		rl.add(r);        
    }
    insert rl; 
}   