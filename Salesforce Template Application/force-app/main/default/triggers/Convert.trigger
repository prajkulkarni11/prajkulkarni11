trigger Convert on Lead (after update) {

    AutoConvert.getLeads(Trigger.new);
}