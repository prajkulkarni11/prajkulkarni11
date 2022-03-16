/**

 * @File Name          : AccountAddress.cls
 * @Description        :  Assignment 01:when account address is changed contact address should be changed.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 2:40:39 pm
* @Modification Log   : 

 **/

public with sharing class AccountAddress {

     public static void updateAddress(List<account> acclist){

        String add,accid,name;

        for(account a: acclist){
            accid = a.Id;
            add= a.OtherAddress__c;
            name = a.Name;
        }

        List<contact> conlist = [select id,Address__c from contact where accountid =:accid];

        for(contact c : conlist){
           c.Address__c=add;
        }

        update conlist;


    }
}