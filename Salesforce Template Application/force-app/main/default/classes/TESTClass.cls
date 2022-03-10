/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 10:17:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:52:32
 * @ Description://find test in accounts lead and opportunities
 */

public with sharing class TESTClass {
    
    public static void display()
    {
    List<list<SObject>> acc = new List<List<SObject>>();
    acc=[Find 'Test' IN ALL FIELDS RETURNING Account(name),Contact(Name), Opportunity(Name)];
    System.debug('' + acc);
    }
	
}