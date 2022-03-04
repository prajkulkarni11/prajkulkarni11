
/**
 * @File Name          : SalaryEmailHandler.cls
 * @Description        : Apex Assignment-send an email to customer when new salary record is created. (add cc,bcc,subject,plaintext,senderdisplayname).
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 04/03/2022, 5:40:39 pm
 * @Modification Log   : 
 
**/


public class SalaryEmailHandler {
    public static void sendEmail(List<Salary__c> sl){
        
        for(Salary__c sln:sl)
        {
            String EmailId = sln.Email__c;
            String SalId = sln.Id;
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            string[] toAdd=new string[]{EmailId};
                    
            email.setToAddresses(toAdd);
                                             
            email.setPlainTextBody('Get Your Salary Slip');
            email.setSenderDisplayName('Salesforce Support');
            email.setSubject('Salary mail : ');
            
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            emails.add(email);
            Messaging.sendEmail(emails);
        }
    }
}