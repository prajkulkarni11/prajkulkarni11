/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:35:31
 * @ Description:Write an apex program, to insert 250 Lead Records inside the object. (InsertLead)
 */



public with sharing class InsertLead {
    public void display()
    {
    List<Lead>addLead = new List<Lead>();
	for(Integer i=1; i< 250; i++) 
    {
      addLead.add( new Lead(status='Open',FirstName='Lead',LastName='Account' + i,company='Infy') );
	}
	System.debug(addLead); 
    insert addLead;
    }
}