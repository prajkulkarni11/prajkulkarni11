trigger BookTrigger on Book__c (before insert,before update) {
if(Trigger.isUpdate|| Trigger.isInsert){
        
        Book.getbook(Trigger.new);
}
}