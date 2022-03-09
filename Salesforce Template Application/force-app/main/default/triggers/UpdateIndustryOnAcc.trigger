trigger UpdateIndustryOnAcc on Account (before insert,before Update) {
if((trigger.isBefore) &&(trigger.isInsert||trigger.isUpdate) )
{
    UpdateIndustryOnAccHandler.upadateAcc(trigger.new);
}
}