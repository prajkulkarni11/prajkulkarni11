/**
 * @ Author: Aishwarya Shelke
 * @ Create Time: 2022-03-10 10:17:25
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 10:46:57
 * @ Description://display sum of all annual revenue of accounts
 */


public with sharing class AnnualRevenueAccount 
{
	public static void display()
    {
    //List<Account>acc = new List<Account>();
    List<AggregateResult>acc=[select SUM(AnnualRevenue) from Account];
    System.debug('Annual Revenue :-' + acc);
    }
}