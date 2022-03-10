/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 10:17:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:53:49
 * @ Description://write sosl query to find name ‘Text Tiles’ in account, opportunity, lead,contacts

 */

public with sharing class TextTile {
    public static void display()
    {
    List<list<SObject>> acc = new List<List<SObject>>();
    acc=[Find 'Text Tiles' IN NAME FIELDS RETURNING Account(name),Contact(Name), Opportunity(Name),Lead(Name)];
    System.debug('' + acc);
    }
	

}