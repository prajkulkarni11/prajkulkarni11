/**
 * @File Name          : FetchMaxAppointment.cls
 * @Description        : Fetch Name, max_no_of_appointments__c of all the clinics that are in Florida.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class FetchMaxAppointment {
    
    public static void displayMaxAppointmentRecords(){
        
        try{
            List<Clinic__c> listOfClinic=[Select name,Max_No_Of_Appointments__c from  Clinic__c where State__c='Florida'];
            
            for(Clinic__c clinic:listOfClinic){
                system.debug('List of Clinic are:-'+clinic);
            }
            
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
        }
    }
}