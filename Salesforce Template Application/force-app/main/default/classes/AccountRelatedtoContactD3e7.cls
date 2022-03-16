/**
* @Class Name        : AccountRelatedtoContactD3e7
* @description       : Querying on Account Object which are related to Contacs only
* @author            : Girish 
**/ 
public with sharing class AccountRelatedtoContactD3e7 {
  public static void main(){
 List<Account> results = [select name from account where id not in (select accountid from contact)];

            System.debug('No contacts account list:'+results);
    }
}