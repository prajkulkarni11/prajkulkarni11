/**
 * @File Name          : ScheduleAccountDeletion.cls
 * @Description        :  Trigger Assignment 16:Client wants only upto 10 records to be created on the Account object daily. Write code which will run every 15 minutes. It will check for Account object records created in last 24 hour period (12 am to 12 pm).  If the count exceeds 10, delete the additional records. Counter will reset at 12 am to 0.

 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 18-03-22, 6:50:39 pm
* @Modification Log   : 
 **/


global with sharing class ScheduleAccountDeletion implements Schedulable {
    public void execute (SchedulableContext sc){
       AccountCountt.ExtraAccountDeletion(); 
    }

}