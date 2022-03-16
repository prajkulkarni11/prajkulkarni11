trigger AccountContactDescUpdate on Account (after update) {
List<Contact> cl = new list<Contact>();
    
    for(Contact c: [Select description,id  from Contact]){
    for(Account a:Trigger.new ){
       
       c.description = 'Account Name '+ a.name + 'Account description ' +a.description; 
        cl.add(c);
    }
    
    }    
    update cl;
}   