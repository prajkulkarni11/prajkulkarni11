/* 
*Class Name : NetSalary
*@description: Net salary using DA HA and Basic Salary 
*@author: Girish
*/
public with sharing class NetSalary {
    public static void blockMain(){
        Integer BS = 10000;
        Integer DA = 20;
        Integer HRA = 30;
        Integer netSalary = BS+((DA*BS)/100)+((HRA*BS)/100);
        system.debug('Net Salary is '+netSalary);
    }
}