
/**

 * @File Name          : AutoConvert.cls
 * @Description        : Trigger Assignment 06:Create a Trigger to Auto-Convert the Lead Records as the Customers upon Changing the Lead Status as "Closed - Converted".  
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 12:40:39 pm
* @Modification Log   : 

 **/

public with sharing class AutoConvert {
    
     public static void getleads(List<Lead> leadlist){

        string status,name;

        for(Lead l:Leadlist){
            name = l.LastName;
            status = l.Status;

            if(status == 'Closed - Converted'){
                Customer c = new Customer();
                c.name = name;
                c.PartyId = '0PK5j000000KyxdGAC';
                insert c;
            }
        }


    }

}