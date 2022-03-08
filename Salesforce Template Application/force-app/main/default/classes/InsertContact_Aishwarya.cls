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