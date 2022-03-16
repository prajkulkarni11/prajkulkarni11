trigger DeDupeEmpEmail on Employee__c (before insert, before update) {
	List<Employee__c> empList = new List<Employee__c>();
    Set<String> newEmailSet = new Set<String>();
     Set<String> ExistingEmailSet = new Set<String>();
    if(trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        empList = Trigger.new;
    }
    for(Employee__c emp : empList){
        if(emp.Employee_email__c!=null){
            newEmailSet.add(emp.Employee_email__c); 
        } 
    }
    List<Employee__c> exisitingEmpList = [Select id,Employee_email__c from Employee__c where Employee_email__c IN:newEmailSet AND Employee_email__c !=null ];
    for(Employee__c emp : exisitingEmpList){
        ExistingEmailSet.add(emp.Employee_email__c);
    } 
    for(Employee__c emp : empList){ 
        if(ExistingEmailSet.contains(emp.Employee_email__c)){
            emp.Employee_email__c.addError('Duplicate Email error');
        }
    }
        }