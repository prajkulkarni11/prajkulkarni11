/**

 * @File Name          : Day2em1
 * @Description        : 
 * @Author             : Girish
 * @Group              : 
 * @Last Modified By   : Girish Reddy
 * @Last Modified On   : 08/03/2022 
* @Modification Log   : 

 **/
public with sharing class Day2exm1 {
    public static void insertrecords(){
        //after step one I got to know to store those data I need list so below is list of leads
        List<Lead> updatedLead = new List<Lead>();
        
   //step one
        for(integer i=0;i<10;i++){
             Lead l = new Lead();
            l.FirstName = 'Xmase '+i ;
            l.LastName = 'sad';
            l.Company = 'a';
           
            
            updatedLead.add(l);
        }
        insert updatedLead;
        
    }
}