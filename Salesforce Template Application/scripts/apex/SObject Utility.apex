

SObjectType objectType = Schema.getGlobalDescribe().get('Contact');

Map<String,Schema.SObjectField> mfields = objectType.getDescribe().fields.getMap();

for(String  field : mfields.keySet() ) {
    System.debug( field +' :::::'  + mfields.get(field).getDescribe().getName());
}

for(ChildRelationship rel: Account.SObjectType.getDescribe().getRelationshipName()) {
    System.debug(' Relation rel :' +rel.getField() + ' relName  ' +rel.getRelationshipName() + ' With '+rel.getChildSObject());
}
// Here

for ( Schema.ChildRelationship scr : Contact.sObjectType.getDescribe().getChildRelationships() ){
    system.debug('');
    system.debug('**** Child SObject         **** ' + scr.getChildSObject());
    system.debug('     Field                 **** ' + scr.getField());
    system.debug('     Relationship Name     **** ' + scr.getRelationshipName());
    system.debug('     Cascade Delete        **** ' + scr.isCascadeDelete());
    system.debug('     Deprecated and Hidden **** ' + scr.isDeprecatedAndHidden());
    system.debug('     Restricted Delete     **** ' + scr.isRestrictedDelete());
}

Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap();

for(String s : objectFields.keySet())
{
Schema.DescribeFieldResult lfieldLabel = objectFields.get(s).getDescribe();
Schema.DisplayType dType = lfieldLabel.getType();
string fieldType = String.ValueOf(dType);
system.debug('******'+fieldType);
}};

Account acc = new Account(name = 'Acme', description = 'Acme Account');
Schema.SObjectType expected = Schema.Account.getSObjectType();
System.assertEquals(expected, acc.getSObjectType());

system.debug('******'+acc.getSObjectType());