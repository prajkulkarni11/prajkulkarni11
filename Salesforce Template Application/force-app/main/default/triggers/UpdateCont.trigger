trigger UpdateCont on Account (After Update) {
if((trigger.isUpdate)&&(trigger.isAfter))
{
  UpdateContactHandler.updatecon(trigger.new);  
}
}