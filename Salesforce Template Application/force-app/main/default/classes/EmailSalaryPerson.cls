/* 
*@ClassName:EmailSalaryPerson
*@Description: Send Email to Salary Person 
*@Author: Girish
*/
Public with sharing class EmailSalaryPerson {
    
Public static void SendEmailAlertToLead(Salary__c ld)
    {
        if(ld.Id != null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            	string[] toAddress = new string[]{ld.Email__c, 'usermahen13@gmail.com'};
                email.setToAddresses(toAddress);
            
            	string[] ccAddress = new string[]{ld.Email__c, 'usermahen13@gmail.com'};
                //email.setCcAddresses(ccAddress);
            
            	string[] bccAddress = new string[]{ld.Email__c, 'usermahen13@gmail.com'};
                //email.setBccAddresses(bccAddress);
            
            	email.setSenderDisplayName('Girish is Display Name');
            
            	email.setReplyTo('support@icicibank.com');
            
            	string emailSubject = 'Congratulations '+ ld.name + '..!! Your Application has been Recieved Successfully.';
            	email.setSubject(emailSubject);
            
                string emailContent = 'Dear '+ ld.name+',<br/><br/>'+
                    					'Thanks for showing your interest in our Organizations Credit Card Services. <br/><br/>'+
                    					'We are pleased to inform you, that we have received your Credit Card Application Successfully, and Stored in our Database. <br/><br/>'+
                    					'We will share the details to the Concerned Department for the further Process. <br/><br/>'+
                    					'Here are your Lead Details..: <br/><br/>'+
                    					'<br/> Applicant Name ...: '+
                    					'<br/><br/> Thanks & Regards,<br/> Credit Card Department, <br/> ICICI Bank.';
                    					
            	email.setHtmlBody(emailContent);
            
            	// Prepare a List Collection to store the Attachments..
            	List<Messaging.EmailFileAttachment> lstAttachments = new List<Messaging.EmailFileAttachment>();
            
            	// Prepare the Attachment..
            	Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            		attach.setContentType('Application/pdf');
            		attach.setFileName(ld.name +'.pdf');
            		attach.body = Blob.toPdf(emailContent);
            
            	// Add the Attachement to the Collection..
            	lstAttachments.Add(attach);
            	
            	// Add the Attachments to Email..
            	email.setFileAttachments(lstAttachments);
            
            // Send the email..
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
                    
        }
    }
}