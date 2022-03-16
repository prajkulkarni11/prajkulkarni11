/**
 * @File Name          : Get_Temprecher.cls
 * @Description        : Fetch daily weather data from https://openweathermap.org/api for Pune and email it daily at 10 am to your personal email. [Use REST API].
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 10/03/2022
  
**/
global with sharing class Get_Temprecher implements Schedulable {
    
    
    static String url='https://api.openweathermap.org/data/2.5/weather?q=pune&appid=d8cf3f5c1721543a7112a882a1a645d3';
    
    static string temprecher='';
    
    global void execute(SchedulableContext sc)
    {
       
        getData();
    }
    
    
    @future(callout=true)
    public static void getData(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        
        if (response.getStatusCode() == 200) {
            
            String jsonString=response.getBody();
            
            JSONParser parser = JSON.createParser(jsonString);
            
            while(parser.nextToken()!= null) {
                if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    parser.nextValue();
                    if(parser.getCurrentName() == 'temp') {
                        System.debug('Value-------->'+ parser.getText());
                        
                        temprecher=parser.getText();
                        
                    }
                }
            }
            
            sendEmail();
        }
    }
    
    public static void sendEmail(){
        // Step 0: Create a master list to hold the emails we'll send
        List<Messaging.SingleEmailMessage> mails =   new List<Messaging.SingleEmailMessage>();
        
        // Step 1: Create a new Email
        Messaging.SingleEmailMessage mail = 
            new Messaging.SingleEmailMessage();
        
        // Step 2: Set list of people who should get the email
        
        list<String> sendTo=new List<string>();
        sendTo.add(Userinfo.getUserEmail());
        mail.setToAddresses(sendTo);
        
        // Step 3: Set who the email is sent from
        mail.setReplyTo('amarng777@gmail.com');
        mail.setSenderDisplayName('Daily Pune Tempracher');
        
        // (Optional) Set list of people who should be CC'ed
        //List<String> ccTo = new List<String>();
        //ccTo.add('amarng777@gmail.com');
        //mail.setCcAddresses(ccTo);
        
        // Step 4. Set email contents - you can use variables!
        mail.setSubject('TODAYS PUNES TEMPRECHER');
        String body = 'Dear Amar ,'+'<br/>';
        body += 'Todays punes tempracher is '+temprecher;
        
        mail.setHtmlBody(body);
        
        // Step 5. Add your email to the master list
        mails.add(mail);
        Messaging.sendEmail(mails);
    }
    
}