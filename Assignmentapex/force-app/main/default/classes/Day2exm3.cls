/**

 * @File Name          : Day2em3
 * @Description        : 
 * @Author             : Girish
 * @Group              : 
 * @Last Modified By   : Girish Reddy
 * @Last Modified On   : 08/03/2022 
* @Modification Log   : 

 **/
public with sharing class Day2exm3 {
    public static void insertOpp(){
        Account acc = new Account();
        acc.Name='Tejas';
        insert acc;
        
        List<Opportunity> lopp = new list<opportunity>();
        for(integer i=0;i<5;i++){
            opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = 'test '+i;
            opp.StageName = 'Closed won';
            opp.CloseDate=date.today();
            
            lopp.add(opp);
        }
        insert lopp;
    }
}