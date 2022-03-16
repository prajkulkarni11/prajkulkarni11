/* 
*@ClassName:MassEmail
*@Description: Send Mass Email starting with letter a in Contacts
*@Author: Girish
*/
public class MassEmail {
    public static void blockMain(){
        List<Contact> clist=[select id,lastname from contact where firstname like 'a%'];
        
        List<id> ids = new list<id>();
        for(Contact c: clist){
            ids.add(c.id);
        }
        EmailTemplate tem = [select id,name from EmailTemplate where name ='Location Approval' limit 1];
        
        messaging.MassEmailMessage email = new messaging.MassEmailMessage();
        email.setTargetObjectIds(ids);
        email.setSenderDisplayName('Im Display Name ');
        email.setTemplateId(tem.id);
        Messaging.sendemail(new Messaging.MassEmailMessage[]{email});
    }
}