/**
 * @ Author: Aishwarya S
 * @ Create Time: 2022-03-15 18:16:01
 * @ Modified by: Your name
 * @ Modified time: 2022-03-15 18:17:18
 * @ Description://Basic salary is 10000 DA=20% of basic salary , HRA= 30% of BS find Net salary (NS=BS+DA+HRA)

 */


public with sharing class Salary
{
    public void netsalary(integer basicSal)
	{       
        Decimal DA = 0.2*basicSal;
        Decimal HRA= 0.3*basicSal;
        Decimal NS = basicSal + DA + HRA;
        system.debug('Net salary ='+ NS);
	}
}
//Execution:
//Salary s= new Salary();
//s.netsalary(10000);