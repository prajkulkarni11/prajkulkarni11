/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-22 16:21:07
 * @ Modified by: Your name
 * @ Modified time: 2022-03-22 16:25:08
 * @ Description: //1.create a visual force page on click of a button display Contact object details.

 */


public with sharing class ButtonDisplayClass {
    public list<Contact>Contacts {get;set;}
    public PageReference onClick()
    {
        Contacts=[select name,email,AccountId from contact];
        return null;
    }

}