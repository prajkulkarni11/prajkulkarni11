global class box6 implements database.Batchable<sObject>, database.stateful {

    global database.QueryLocator start(database.BatchableContext bc){
        string query='select Name,Priority__c,Response_Date__c,CreatedDate from Complaint__c';
        
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<Complaint__c> scope){
       
        for(Complaint__c c:scope){
            
            if(c.Priority__c=='Critical'){
                c.Response_Date__c=c.CreatedDate.addHours(6);
             
            }
            else if(c.Priority__c=='High'){
                c.Response_Date__c=c.CreatedDate.addDays(2);
             
            }
            else if(c.Priority__c=='Medium'){
                c.Response_Date__c=c.CreatedDate.addDays(5);
            
            }
            else if(c.Priority__c=='Low'){
                c.Response_Date__c=c.CreatedDate.addDays(10);
                
            }
         
       }
         update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}