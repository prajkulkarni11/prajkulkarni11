
//Delete All Accounts 
List<Account> accounts = [Select id , name from Account where name != 'Sample Account for Entitlements' ];
delete accounts;

//Clean Contacts 
List<Contact> contacts = [Select id , name from Contact ];
delete contacts;
