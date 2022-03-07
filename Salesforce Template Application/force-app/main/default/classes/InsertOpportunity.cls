
/**

 * @File Name          : InsertOpportunity.cls
 * @Description        : Collection Assignment 04:Create a Map and insert record into opportunities object using map
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 4:40:39 pm
* @Modification Log   : 

 **/

public with sharing class InsertOpportunity {

    public static void insertOpportunityUsingMap(){
        try{
            map<Integer,Opportunity> oppMap=new map<Integer,Opportunity>();

            oppMap.put(1,new Opportunity(Name='Pune',CloseDate=date.newInstance(2022,10,29),StageName='Qualification'));
            oppMap.put(2,new Opportunity(Name='Mumbai',CloseDate=date.newInstance(2022,10,30),StageName='Value PropositionA'));
            oppMap.put(3,new Opportunity(Name='Delhi',CloseDate=date.newInstance(2022,10,26),StageName='Prospecting'));

            Insert oppMap.values();
            System.debug('Key values of inserted map records:'+oppMap.values());

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }

}