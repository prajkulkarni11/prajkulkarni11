trigger CountContact on Contact (After insert,before delete) {
    if(trigger.isinsert )
    {
        if(!Countcontact.flag)
    Countcontact.addcountcon(trigger.new);
    }
if(trigger.isdelete)
{
     if(!Countcontact.flag)
   Countcontact.subcountcon(trigger.old);
}
}