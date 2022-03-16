/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:41:02
 * @ Description:Write an apex program, to insert 400 Contact Records inside the object.(InsertContact)

 */



public with sharing class InsertContact {
    public InsertContact() {

    }
    public void display()
    {
    List<Contact>addCon = new List<Contact>();
	for(Integer i=1; i< 400; i++) 
    {
      addCon.add( new Contact(FirstName='Contact',LastName='GitHub' + i) );
	}
	System.debug(addCon); 
    insert addCon;
    }
}