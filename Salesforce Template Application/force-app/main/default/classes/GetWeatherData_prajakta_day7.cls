/**
 * @ Author: Prajakta kulkarni
 * @ Create Time: 2022-03-14 15:23:31
 * @ Modified by: Your name
 * @ Modified time: 2022-03-14 15:24:55
 * @ Description:Day-7
1.Fetch daily weather data from https://openweathermap.org/api for Pune and email it daily at 10 am to your personal email. [Use REST API].

 */




global class GetWeatherData implements Schedulable {
    
    static String url='https://api.openweathermap.org/data/2.5/weather?q=pune&APPID=78b47c9a2e57ae67fb2f6e1b75242ed8';
    
    static string temperature = '';
    
    global void execute(SchedulableContext sc){
        
        getData();
    }
        
	@future(callout=true)
    public static void getData(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            
            String jsonString=response.getBody();
            
            JSONParser parser = JSON.createParser(jsonString);
            
            while(parser.nextToken() != null){
                if(parser.getCurrentToken() == JSONToken.FIELD_NAME){
                    parser.nextValue();
                    if(parser.getCurrentName() == 'temp'){
                        System.debug('Value---------->'+ parser.getText());
                        
                        temperature=parser.getText();
                    }
                }
            }
            
            sendEmail();
                        
        }
      }
    
    public static void sendEmail(){
        //step 0: Create a master list to hold the emails we'll send
        List<Messaging.SingleEmailMessage> Mails = new List<Messaging.SingleEmailMessage>();
        
        //step 1 : Create a new Email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        //step 2: Set the list of the people who should get the email
        list<String> sendTo = new List<String>();
        sendTo.add(Userinfo.getUserEmail());
        mail.setToAddresses(sendTo);
        
        //step 3: Set who the email is sent from
        mail.setreplyto('aishwaryashelke075@gmail.com');
        mail.setSenderDisplayName('Daily Pune-Temperature');
        
                
        //step 4: set email contents you can use variables
        mail.setSubject('TODAYS PUNES TEMPERATURE');
        String body = 'Hello Aishwarya, '+' </br>';
        body += 'Todays Punes Temperature is :'+temperature;
        
        mail.setHtmlBody(body);
        
        //step 5: Add your eamil to the master list
        mails.add(mail);
        Messaging.sendEmail(mails);
      }
  }
//String jobID = System.schedule('ScheduleWeatherData', '0 0 10 * * ? *' , new GetWeatherData());