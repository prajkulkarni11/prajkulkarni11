/**

 * @File Name          : Description.cls
 * @Description        :Trigger Assignment 02:There is a description field on Account and also on Contact. Whenever the account description is updated, the related Contact description should also be updated but I should be able to identify from the description which account this contact is related to.
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 4:40:39 pm
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