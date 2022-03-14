
/**

 * @File Name          : Description.cls
 * @Description        :  Assignment 02:when account is updated, opportunity associated to it should be updated in there description field is same +add account name
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 12-03-22, 2:40:39 pm
* @Modification Log   : 

 **/

public with sharing class Description {

    public static void getdescription(List<account> acclist){

        String descrip,accid,name;

        for(account a: acclist){
            accid = a.Id;
            descrip= a.Description;
            name = a.Name;
        }

        List<contact> conlist = [select id,description from contact where accountid =:accid];

        for(contact c : conlist){
           c.description=descrip+' account name :- '+ name;
        }

        update conlist;


    }
}