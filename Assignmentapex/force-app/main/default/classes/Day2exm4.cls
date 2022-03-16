/**

 * @File Name          : Day2em4
 * @Description        : 
 * @Author             : Girish
 * @Group              : 
 * @Last Modified By   : Girish Reddy
 * @Last Modified On   : 08/03/2022 
* @Modification Log   : 

 **/
public with sharing class Day2exm4 {
    public static void insertrecords(){
        map<Integer, Opportunity> oppMap = new map<Integer, Opportunity>();
        
  oppMap.put(1,new Opportunity(Name='Pune', closeDate=date.newInstance(2012, 04,29),stageName='Qualification'));
        
        
    }
}