trigger CreateNumberOfCont on Account (After insert) {
if(trigger.isAfter && trigger.isInsert)
{
    CreateNumberOfCon.createcon(trigger.new);
}
}