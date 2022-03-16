trigger AutoLeadConevrt on Lead (after insert) {  
	  
     
            List<Customer__c> InsertCustList = new List<Customer__c> ();
            List<Lead> leadlist =[Select id,name from lead];
            for(Lead l:leadList)
            {
                if(l.status=='Closed - Converted')
                {
                    Customer__c a=new Customer__c();
                    a.Name=l.company;
                   // a.Email__c =l.Email;
                   // a.Address__c=l.City;
                    InsertCustList.add(a);
                }  
            }
           
            insert InsertCustList;
        
}