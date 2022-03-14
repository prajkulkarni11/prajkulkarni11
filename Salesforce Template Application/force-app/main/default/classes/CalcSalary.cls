public with sharing class CalcSalary {
	public void calcTotalSalary()
    {
        integer BasicSal=10000;
        integer DA=(10000/100)*20;
        integer HRA = (10000/100)*30;
        integer totalSal = BasicSal + DA + HRA;
        system.debug('total salary ='+totalSal);
    }
}