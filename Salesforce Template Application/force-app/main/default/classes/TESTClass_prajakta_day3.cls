/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:50:12
 * @ Description:Fetch the account,opportunity,contact records where name is test
 */

//find test in accounts lead and opportunities


public with sharing class TESTClass {
    
    public static void display()
    {
    List<list<SObject>> acc = new List<List<SObject>>();
    acc=[Find 'Test' IN ALL FIELDS RETURNING Account(name),Contact(Name), Opportunity(Name)];
    System.debug('' + acc);
    }
	
}