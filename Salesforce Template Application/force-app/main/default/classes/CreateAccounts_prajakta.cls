/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:55:36
 * @ Description:Create a simple REST API in apex with HTTP Request to insert,delete ,retrieve and update a record.
 */


//1.Create a simple REST API in apex with HTTP Request to insert,delete ,retrieve and update a record.
@RestResource(urlmapping='/showAccounts/*')
global with sharing class CreateAccounts
{
    @httpGET
    global static LIST <Account>getAccount()
    {
    LIST<Account>lst;
    try
    {
    lst=[select name, phone from account];
    }
    catch(Exception e)
    {
    system.debug('ERROR'+e.getMessage());
    }
    return lst;
    }
    
     /*@HttpGET
    global static Account doGet()
    {
    RestRequest req=RestContext.Request;
    RestResponse res=RestContext.Response;
    String accountId=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
    system.debug('Account ID:'+accountId);
    Account result=[select id,name from account where id=:accountId];
    return result;
    }*/
    
    @httpDelete
    global static void doDelete()
    {
    RestRequest req=RestContext.Request;
    RestResponse res=RestContext.Response;
    String accountId=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
    Account result=[select id,name from account where id=:accountId];
    delete result;
    }
    
    @HttpPost
    global static string doPost(String name, string phone,string email)
    {
    Account acc=new Account();
    acc.Name=name;
    acc.phone=phone;
    acc.email__c=email;
    insert acc;
    return acc.Id;
    }
    
    //here updating city of a record
    @HttpPut
    global static Account doPut(String city)
    {
    RestRequest req=RestContext.Request;
    RestResponse res=RestContext.Response;
    String accountId=req.requestURI.substring(req.requestURI.lastindexOf('/')+1);
    Account result=[select id,city__c from account where id=:accountId];
    //Account acc=new Account();
    result.city__c=city;
    update result;
    return result;
    }    
    
}