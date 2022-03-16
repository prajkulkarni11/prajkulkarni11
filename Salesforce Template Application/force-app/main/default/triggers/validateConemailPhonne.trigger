trigger validateConemailPhonne on Contact (before insert,before Update) {
if((trigger.isbefore)&&((trigger.isinsert)||(trigger.isupdate)))
{
    validateConemailPhonne.validate(trigger.new);
}
}