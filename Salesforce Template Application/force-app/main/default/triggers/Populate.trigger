trigger Populate on Lead (before insert, before update) {

    AutoPopulate.getdata(trigger.new);
}