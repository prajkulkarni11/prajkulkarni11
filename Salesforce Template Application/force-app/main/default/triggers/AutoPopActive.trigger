trigger AutoPopActive on Account (before insert) {
    if((trigger.isbefore)&&(trigger.isInsert))
    {
		AutoPopActive.checkActive(trigger.new);
    }

}