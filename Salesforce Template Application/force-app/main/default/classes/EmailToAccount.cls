global class EmailToAccount implements Messaging.InboundEmailHandler{
global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelop)
{
Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
String Accnum = email.fromName;
String name =email.subject;
 string descr =   email.plainTextBody; 
Account Ac = new Account(Name = name,AccountNumber=Accnum,Description=descr);
insert ac;
return null;
	}
}