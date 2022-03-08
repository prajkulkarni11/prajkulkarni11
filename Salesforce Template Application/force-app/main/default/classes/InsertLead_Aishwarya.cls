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