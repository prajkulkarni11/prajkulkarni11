
/**
 * @description       : Apex Assignment
 * @author            : Swapnil Thalal
 * @group             : 
 * @last modified on  : 02-03-22
 * @last modified by  : Swapnil Thalal
**/


public with sharing class FetchAccount {
    
    public  Id accountid;
    public  List<Account> lst_acc;
   
   
    public void contactFieldsConcat(Id accid){
        
        accountid = accid;
              
string query ='select id, name, (select id, name from Contacts),(select id, name from opportunities),(select Status from cases)from account where id =: '+accountid;
        lst_acc = Database.query(query);
        system.debug(lst_acc);
}

}