/**
* @Class Name        : SumOfAnnualRevenueD3e3
* @description       : Querying on Account Object to find sum of Annual Revenue
* @author            : Girish
**/ 
public with sharing class SumOfAnnualRevenueD3e3 {
    public static void main(){
        Account acc = new Account();
        
        List<AggregateResult> accList = [Select Sum(AnnualRevenue) from account];
        system.debug('Anual Salary is '+accList);
    }
}