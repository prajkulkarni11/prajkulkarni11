/**

 * @File Name          : FetchMaxAppointments.cls
 * @Description        : soql & sosl Assignment 01:Fetch Name, max_no_of_appointments__c of all the clinics that are in
Florida.

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 05/03/2022, 3:40:39 pm
* @Modification Log   : 

 **/

public with sharing class FetchMaxAppointments {

        public static void displayMaxAppointmentRecords(){

        try{
            List<Clinic__c> listOfClinic=[Select name,MaxNoOfAppointments__c from  Clinic__c where State__c='Florida'];

            for(Clinic__c clinic:listOfClinic){
                system.debug('List of Clinic are:-'+clinic);
            }

        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }
}