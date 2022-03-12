trigger ContactSalutationUpdate on Contact (before insert, before update) {
		List<contact> cl = new list<contact>();
    
    for(Contact c: trigger.new){
        if(c.Gender__c == 'Male'){
            c.salutation = 'Mr';
             cl.add(c);
        }
        else if(c.Gender__c == 'Female'){
            c.salutation = 'Mrs';
             cl.add(c);
        } 
    }
}   