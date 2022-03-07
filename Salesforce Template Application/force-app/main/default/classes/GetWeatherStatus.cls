
/**

 * @File Name          : GetWeatherStatus.cls
 * @Description        :Rest Api Assignment 03:Fetch daily weather data from https://openweathermap.org/api for Pune and email it daily at 10 am to your personal email. 

 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 07/03/2022, 6:40:39 pm
* @Modification Log   : 

 **/ 


global class GetWeatherStatus Implements Schedulable{
    String status='';
    public  void getweathertemperature(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q=mumbai&appid=109c050774e2d734185faa34c38d3dfb');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            String restoresult = response.getBody();
            JSONParser jpars = JSON.createParser(restoresult);
            
            while(jpars.nextToken()!=null){
                if(jpars.getCurrentToken()==JSONToken.FIELD_NAME){
                    jpars.nextValue();
                    if(jpars.getCurrentName()=='temp')
                    {
                        System.debug(jpars.getText());
                        status = jpars.getText();
                        system.debug(status);
                    }
                }
            }
        }
    }
    global void execute(SchedulableContext sc)
    {
        sendmail();
    }
    
    public void sendmail()
    {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string [] toaddress= New string[]{'swapnil141615@gmail.com'};
            email.setSubject('Testing Whether Information');
        email.setPlainTextBody(status);
        email.setToAddresses(toaddress);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
}