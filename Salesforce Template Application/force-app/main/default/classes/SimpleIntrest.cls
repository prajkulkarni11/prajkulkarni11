public with sharing class SimpleIntrest {
	public void calcIntrest()
    {
        integer principle =120000;
        integer rate = 7;
        integer timeperiod =10; 
        integer finalAmount;
        finalAmount =principle*(1+rate*timeperiod);
        system.debug('simple intrest value is'+finalAmount);
    }
}