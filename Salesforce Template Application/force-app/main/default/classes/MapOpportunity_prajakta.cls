/**
 * @ Author: Prajakta Kulkarni
 * @ Create Time: 2022-03-10 15:16:52
 * @ Modified by: Your name
 * @ Modified time: 2022-03-10 15:36:24
 * @ Description:Create a Map and insert record into opportunities object using map.(OpportunityMap)
 */



public with sharing class MapOpportunity {
 public static void insertOppWithMap(){
        
            map<Integer,Opportunity> oppMap=new map<Integer,Opportunity>();

            oppMap.put(1,new Opportunity(Name='Pimpri',
                                         CloseDate=date.newInstance(2022,3,12),
                                         StageName='Closed Won'));
           
            Insert oppMap.values();
            System.debug('Opportunity record:'+oppMap.values());
     
    }
}