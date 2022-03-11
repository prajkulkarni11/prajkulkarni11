trigger LeadIndustryUpdate on Lead (before insert,before update) {
    List<lead> lList = new list<Lead>();
    for(Lead l:trigger.new){
        if(l.Industry == 'Banking'){
            l.AnnualRevenue = 9000000;
        }
        else if(l.Industry == 'Finance'){
            l.AnnualRevenue = 7600000;
        }
        else if(l.Industry == 'Manufacturing'){ 
            l.AnnualRevenue = 8400000;
        } 
        else if(l.Industry == 'Insurance'){ 
            l.AnnualRevenue = 4500000;
        } 
        else if(l.Industry == 'Education'){ 
            l.AnnualRevenue = 7400000;
        }
        else if(l.Industry == 'Consulting'){
            l.AnnualRevenue = 3200000;
        }
        else if(l.Industry == 'Energy'){
            l.AnnualRevenue = 9400000;
        }
    }
	
    
}