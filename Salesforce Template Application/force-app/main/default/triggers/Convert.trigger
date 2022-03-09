trigger Convert on Lead (after update) {

    HandlerLeadRecord.createRecords(Trigger.new);
}