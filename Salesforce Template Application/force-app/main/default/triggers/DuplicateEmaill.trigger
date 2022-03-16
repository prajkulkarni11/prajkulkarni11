trigger DuplicateEmaill on Employee1__c (before insert) {
  
    String email;
    for(Employee1__c e : trigger.new){
        email = e.email__c;

        List<Employee1__c> emp = [select id from Employee1__c where email__c =: email];
        if(emp.size() > 1){
            e.addError('Duplicate id email');
        }
    }

}