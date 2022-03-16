/**
* @Class Name        : ContactListRelatedtoAccD3e6
* @description       : Querying on Contact Object which only has Related Account
* @author            : Girish
**/ 
public with sharing class ContactListRelatedtoAccD3e6 {
    public static void main(){
        List<contact> c = [select id,name, Account.Name from Contact where account.name != null];
        system.debug(c);
    }
}