trigger CustomerProjectTrigger on Cutomer_Project__c (after insert) {

    CustomerProjectHandler.updateopp(trigger.new);
 
}