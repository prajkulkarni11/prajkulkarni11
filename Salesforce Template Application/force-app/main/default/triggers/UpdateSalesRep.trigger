trigger UpdateSalesRep on Account (After insert,After Update) {

UpdateSalesRep.updatesaleRep(trigger.new);
   
}