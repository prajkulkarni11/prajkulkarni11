/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-10-2022
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class ReportHelper {

    @AuraEnabled
    public static String getEmployerContribution(ID companyId){
        String employerContibution  = null;
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return employerContibution ;
    }

    @AuraEnabled
    public static String getGrossPay( ID companyId  ){
        String grosspayData  = null;
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return grosspayData ;
    }

    @AuraEnabled
    public static String getRegionsAvailable( ID companyId  ){
        try {
            List<Region> regions = new List<Region>();

            Region asiaPac = new Region('1' , 'ASIAPAC');
            asiaPac.addCountry('1', 'India' );
            asiaPac.addCountry('2', 'Japan' );
            asiaPac.addCountry('3', 'China' );
            asiaPac.addCountry('4', 'Afganistan' );
            regions.add(asiaPac);

            Region latam = new Region('2' , 'LATAM');
            latam.addCountry('1', 'Brazil' );
            latam.addCountry('2', 'Mexico' );
            latam.addCountry('3', 'Colombia' );
            latam.addCountry('4', 'Argentina' );
            regions.add(latam);


            Region emea = new Region('3' , 'EMEA');
            emea.addCountry('1', 'Australia' );
            emea.addCountry('2', 'Austria' );
            emea.addCountry('3', 'Belgium' );
            emea.addCountry('4', 'France' );
            emea.addCountry('4', 'Germany' );
            emea.addCountry('4', 'Netherlands' );
            emea.addCountry('4', 'New Zealand' );
            regions.add(emea);

            Region northAmerica = new Region('4' , 'NORTH AMERICA');
            northAmerica.addCountry('1', 'Guatemala' );
            northAmerica.addCountry('2', 'Honduras' );
            northAmerica.addCountry('3', 'El Salvador,' );
            northAmerica.addCountry('5', 'Costa Rica' );
            northAmerica.addCountry('6', 'Nicaragua' );
            northAmerica.addCountry('7', 'Panama ' );
           regions.add(northAmerica);

           return JSON.serialize(regions);
           
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


    public class Region{
        public String id;
        public String name;
        public List<Country> countries;
        
        public Region(String Id, String name){ this.id= Id ; this.name=name;} 

        public void addCountry(String id,String name){
            if(countries == null){
                this.countries = new List<Country> ();
            }
            this.countries.add( new Country(id,name));
        }
    }
    public class Country{
        public String id;
        public String name;
        public Country(String Id, String name){ this.id= Id ; this.name=name;} 
    }

}
