trigger PreventDeleteAcc on Account (before insert) {
    if((trigger.isBefore)&&(trigger.isinsert))
    {
    PreventDeleteAcc.checkContact(trigger.new);
}
}