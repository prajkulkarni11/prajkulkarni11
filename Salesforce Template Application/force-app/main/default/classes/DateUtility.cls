/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 11-18-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class DateUtility {

    public static final String  DATE_FORMAT_DAY = 'dd';
    public static final String  DATE_FORMAT_MONTH = 'mm';
    public static final String  DATE_FORMAT_LONGYEAR = 'YYYY';
    public static final String  DATE_FORMAT_SHORTYEAR  = 'yy';

    public static final String  DATE_FORMAT_DATESEPRATOR  = '-';
    public static final String  DATE_FORMAT_TIMESEPRATOR  = ':';
    public static final String  DATE_FORMAT_TIMESTAMPSEPRATOR  = 'T';

    public static final String  DATE_FORMAT  = 'YYYY-MM-DD';
    public static final String  DATETIME_FORMAT  = 'YYYY-MM-DDThh:mm:ss+hh:mm';
    public static final String  DATETIME_FORMAT1  = 'YYYY-MM-DDThh:mm:ss-hh:mm';
    public static final String  DATETIME_FORMAT2  = 'YYYY-MM-DDThh:mm:ssZ';

     
    /**
     * Parse given String date and Return <code>Date</code> Object 
     * 
     */
    public static Date parseDate(String stringDate ) {
        Date dateValue = null;
        dateValue = Date.parse(stringDate);
        return dateValue;
    }

    /**
     * Parse given String date  and Return <code> DateTime </code> Object  
     * 
     */
    public static DateTime parseDateTime(String stringDate ) {
        DateTime dateValue = null;
        dateValue = DateTime.parse(stringDate);
        return dateValue;
    }  

    /**
     * Parse Date with Date format and return DateTime 
     * 
     */
    public static DateTime parseDateTime(String stringDate , String dateFormat) {
        DateTime dateValue = null;
        if( dateFormat != null && stringDate !=  null ) {
            //Decide on Date Seprator 
            String dateSeprator = getDateSeprator(dateFormat);
            dateValue = parseDateTimeFields(stringDate ,dateFormat ,dateSeprator);
        }     
        return dateValue;
    }  

    /**
     * get the Date seprator by reading the date or Format
     * 
     */
    private static String getDateSeprator(String stringDate){
        String dateSeprator = '/';
        if (stringDate.indexOf('-') > 0){
            dateSeprator = '-';
        }
        return dateSeprator;
    }

    /**
     * Get the Date and format and parse the Date with Format
     * 
     */
    public  static DateTime parseDateTimeFields(String dateValue , String dateFormat, String dateSeprator) {
        List<String> dateFieldNames = dateFormat.split(dateSeprator);
        List<String> dateFieldsValues = dateValue.split(dateSeprator);
        Integer year = 0 , day = 0, month = 0, hours = 0 , minutes = 0, seconds = 0;
        Integer index = 0;
        for( String dateFieldName : dateFieldNames ) {
            dateFieldName = dateFieldName.toUpperCase();
            
            switch on  dateFieldName {

                when  'DD' {
                    day = Integer.valueOf( dateFieldsValues[index].trim() );
                }
                    
                when  'MM' {
                    month = Integer.valueOf( dateFieldsValues[index].trim() );
                }

                when  'YY' {
                    year = Integer.valueOf( dateFieldsValues[index].trim() );
                }
                when  'YYYY' {
                    year = Integer.valueOf( dateFieldsValues[index].trim() );
                }
            }
            index++;
        }
        DateTime newDateTime = DateTime.newInstance(year, month, day);
        return newDateTime;
    }
    /**
     * Provides the Time between two times - startTime and endTime
     * @param startTime - the start time
     * @param endTime - the end time
     * @return - the duration between two Time instances 
     */
    public static Time getTimeBetween(Time startTime, Time endTime){
        if(startTime == null || endTime == null){
            return Time.newInstance(0, 0, 0, 0);
        }
        
        Integer elapsedHours = endTime.hour() - startTime.hour();
        Integer elapsedMinutes = endTime.minute() - startTime.minute();
        Integer elapsedSeconds = endTime.second() - startTime.second();
        Integer elapsedMiliseconds = endTime.millisecond() - startTime.millisecond();
        
        return Time.newInstance(elapsedHours, elapsedMinutes, 
                        elapsedSeconds, elapsedMiliseconds);
    }

    /**
     * Provides the Time between two DateTimes - startTime and endTime
     * @param startDate - the start date
     * @param endDate - the end date
     * @return - the duration between two DateTime instances
     */
    public static Time getTimeBetweenDates(DateTime startDate, DateTime endDate){
        if(startDate == null || endDate == null){
        return Time.newInstance(0, 0, 0, 0);
        }
        return GetTimeBetween(startDate.time(), endDate.time());
    }
}