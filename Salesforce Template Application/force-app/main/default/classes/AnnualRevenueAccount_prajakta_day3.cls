/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-11 10:51:42
 * @ Modified by: Your name
 * @ Modified time: 2022-03-11 10:53:00
 * @ Description:Display sum of all annual revenue of accounts
 */

//display sum of all annual revenue of accounts
public with sharing class AnnualRevenueAccount 
{
	public static void display()
    {
    //List<Account>acc = new List<Account>();
    List<AggregateResult>acc=[select SUM(AnnualRevenue) from Account];
    System.debug('Annual Revenue :-' + acc);
    }
}