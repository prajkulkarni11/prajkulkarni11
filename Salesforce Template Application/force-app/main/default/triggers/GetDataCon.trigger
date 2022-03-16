trigger GetDataCon on Contact (before insert,before update) {

    GetDataAccount.getdata(trigger.new);
}