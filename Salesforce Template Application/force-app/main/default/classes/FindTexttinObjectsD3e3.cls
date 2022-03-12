/**
* @Class Name        : FindTexttinObjectsD3e3
* @description       : Finding particular keyword in multiple objects using SOSL
* @author            : Girish
**/ 
public with sharing class FindTexttinObjectsD3e3 {
 public static void display()
    {
    List<list<SObject>> acc = new List<List<SObject>>();
    acc=[Find 'Test' IN ALL FIELDS RETURNING Account(name),Contact(Name), Opportunity(Name)];
    System.debug('' + acc);
    }
}