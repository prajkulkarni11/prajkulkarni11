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