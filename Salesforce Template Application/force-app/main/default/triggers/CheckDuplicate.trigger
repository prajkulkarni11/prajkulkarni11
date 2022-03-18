trigger CheckDuplicate on Account (before insert) {
if(trigger.isbefore &&trigger.isinsert)
{
    CheckDuplicateHandler.check(trigger.new);
}
}