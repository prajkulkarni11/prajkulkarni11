/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-12 12:41:13
 * @ Modified by: Your name
 * @ Modified time: 2022-03-12 12:51:10
 * @ Description:Fetch the account,opportunity,contact ,lead records where name is Text file
 */

//write sosl query to find name ‘Text Tiles’ in account, opportunity, lead,contacts



public with sharing class TextTile {
    public static void display()
    {
    List<list<SObject>> acc = new List<List<SObject>>();
    acc=[Find 'Text Tiles' IN NAME FIELDS RETURNING Account(name),Contact(Name), Opportunity(Name),Lead(Name)];
    System.debug('' + acc);
    }
	

}