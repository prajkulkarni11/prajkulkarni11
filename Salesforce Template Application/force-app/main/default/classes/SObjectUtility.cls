/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-06-2022
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class SObjectUtility {

    public static final STRING  DATATYPE_DATE = 'DATE';
    public static final STRING  DATATYPE_DATETIME = 'DATETIME';
    public static final STRING  DATATYPE_DECIMAL = 'DOUBLE';
    public static final STRING  DATATYPE_NUMBER = 'NUMBER';
    public static final STRING  DATATYPE_CURRENCY = 'CURRENCY';
    public static final STRING  DATATYPE_BOOLEAN = 'BOOLEAN';
    public static final STRING  DATATYPE_REFERENCE = 'REFERENCE';
    /**
     * Provides a list of all fields in a Custom Object
     *
     * @param sObjName - custom object name in string format e.g. 'Account'
     * @return - Returns List of all fields in a custom object
     */
    public static List<String> getAllFieldsForSObject(String sObjName){
        if(String.isBlank(sObjName)){
            throw new UtilityException('Argument \'sObjName\' missing. '
                    + 'Custom Object Name is required');
        }
        List<String> fieldList = 
                new List<String>(Schema.getGlobalDescribe()
                                .get(sObjName)
                                .getDescribe()
                                .fields.getMap()
                                .keySet());
        return fieldList;
    }
    
    /**
     * Provides a SOQL equivalent of the SQL 'SELECT * FROM ..' statement.
     *
     * @param sObjName - custom object name in string format e.g. 'Account'
     * @return - Returns 'SELECT <field1>, <field2>,... FROM sObjName'
     */
    public static String getAllFieldsInSOQLSelect(String sObjName) {
        if(String.isBlank(sObjName)){
            throw new UtilityException('Argument \'sObjName\' missing. ' 
                    + 'Custom Object Name is required');
        }
        List<String> fieldList = getAllFieldsForSObject(sObjName);
        String fields = String.join(fieldList,',');
        String soqlQuery = 'SELECT ' + fields + ' FROM ' + sObjName;
        return soqlQuery;
    }
    /**
     * Provides the type of a field on a custom object. 
     * 
     * @param sObjName - custom object name in string format e.g. 'Opportunity'
     * @param fieldName - custom object field name in string format e.g. 'Area__c'
     * 
     * @return - Returns 'STRING' or 'DATE' or 'DATETIME' or 'NUMBER'
     */ 
    public static String getFieldType(String sObjName, String fieldName){
        String fieldType = null;
        
        if(String.isBlank(sObjName)){
            throw new UtilityException('Argument \'sObjName\' missing. ' 
                        + 'Custom Object Name is required');
        }
        if(String.isBlank(fieldName)){
            throw new UtilityException('Argument \'fieldName\' missing. ' 
                + 'Custom Object Field Name is required');
        }
        
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(sObjName);
        
        Schema.DescribeSObjectResult descObjResult = objType.getDescribe();

        Map<String, SObjectField> fields = descObjResult.fields.getMap();
        SObjectField objField = fields.get(fieldName);
       
                                             
        if( objField != null ) {
            Schema.DescribeFieldResult field = objField.getDescribe();

                if(field.getType() == Schema.DisplayType.DATE){
                    fieldType = DATATYPE_DATE ;
                } else if(field.getType() == Schema.DisplayType.DATETIME){
                    fieldType = DATATYPE_DATETIME;
                } else if(field.getType() == Schema.DisplayType.DOUBLE || 
                        field.getType() == Schema.DisplayType.INTEGER){
                    fieldType = DATATYPE_NUMBER;
                } else if(field.getType() == Schema.DisplayType.CURRENCY ){
                    fieldType = DATATYPE_CURRENCY ;
                } else if(field.getType() == Schema.DisplayType.BOOLEAN ){
                    fieldType = DATATYPE_BOOLEAN ;    
                } else if(field.getType() == Schema.DisplayType.ADDRESS || 
                        field.getType() == Schema.DisplayType.STRING || 
                        field.getType() == Schema.DisplayType.PHONE ||
                        field.getType() == Schema.DisplayType.TEXTAREA ||
                        field.getType() == Schema.DisplayType.PICKLIST){
                            fieldType = 'STRING';
                }
        }
        return fieldType;
    }
    /**
     * 
     * get SObject API Name from Label
     */
    @AuraEnabled
    public static String getObjectNameFromLabel (String objectLabel) {
		
        String sObjectName = objectLabel.toUpperCase();
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        Map<String,String> objectNames = new Map<String,String>();
        for(Schema.SObjectType f : gd)
        {
            String objectName = f.getDescribe().getLabel();
            objectNames.put( objectName.toUppercase(),f.getDescribe().getName());
        }
       return objectNames.get( sObjectName );
    }


    /**
    * @description  isObject Exist will check if the given objectName does exist 
    *               in the Organization
    * @author Yogesh.Bhosale | 12-11-2021
    * 
    * @param objectName 
    * @return Boolean true if Object Exist false otherwise
    **/
    public  static Boolean isObjectExist(String objectName) {
        Boolean isAvailable = true;
        return isAvailable;
    }
    
    /**
    * @description Create new Empty Object 
    * @author Yogesh.Bhosale | 12-11-2021 
    * @param objectName API name of the Object
    * @return SObject 
    **/
    public static SObject newInstance(String objectName){
        //Object Name should not be non empty
        if (objectName == null) {
            throw new InvalidObjException('Invalid Object Name'+ objectName);
        } 

        String objectAPIName = getObjectNameFromLabel(objectName);
        //if we could not get API  object 
        if (objectAPIName == null) {
            throw new InvalidObjException('Invalid Object Name'+ objectName);
        } 

        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectAPIName);
        
        //rare possiblity when user do not have access to Object type 
        if (targetType == null   ) {
            throw new InvalidObjException('Invalid Object Name'+ objectName);
        } 
      
        // Instantiate an sObject with the type passed in as an argument
        //  at run time.
        return targetType.newSObject(null,true); 
 
    } 
 
    /**
    * @description Create Object from JSON
    *
    * @author Yogesh.Bhosale | 12-11-2021 
    * @param sobjectContent 
    * @return SObject 
    **/
    @AuraEnabled
    public static SObject createSObject(String sobjectContent){

        logutility.logMessage('Start Processing ');
        Record sourceData  = (Record)JSON.deserialize(sobjectContent, Record.class);
        SObject response = null;
        logutility.logMessage('Creating the Object from Source Data');
        if(sourceData != null ) {

            String objectAPIName = getObjectNameFromLabel(sourceData.objectName);

            logutility.logMessage('Creating object of Type :'+objectAPIName);
            
            response = newInstance(objectAPIName);
            //populating the values 
            logutility.logMessage('populating the Attributes for :'+objectAPIName);
            if( sourceData.objectData != null ) {
                populateAttribute( objectAPIName ,response, sourceData.objectData);
            }else {
                logutility.logMessage('populating the Attributes  :'+objectAPIName +' not possible as not attribute data available ');
            }

        } else {
            Logutility.logMessage('Cant process as input Record is null ');
        }
        insert response;
        
        return response;

    } 
    /**
    * @description 
    * @author Yogesh.Bhosale | 12-12-2021 
    * @param objectAPIName 
    * @param destinationObject 
    * @param objectData 
    **/
    public static void populateAttribute( String objectAPIName ,SObject destinationObject, List<Field> objectData){
        
        SObjectMetadata metadata = new SObjectMetadata( objectAPIName );

        for( Field attribute  : objectData){
            String fieldLabel = attribute.FieldName;
            String fieldValue = attribute.FieldValue;

            //Consider Field is given as input 
            String fieldApiName = metadata.getField(fieldLabel);  
            //if API not Found then Consider it as lable 
            if( fieldApiName == null )
                fieldApiName = metadata.getFieldApiNameFromLabel(fieldLabel);
            
             
            Logutility.logMessage(' Field Name :'+fieldLabel +' Using API :'+fieldApiName);
           if (fieldApiName != null ){
                String fieldType = metadata.getFieldType(fieldApiName);

                setFieldValue(destinationObject,fieldApiName, fieldType ,fieldValue );

           }else {
               Logutility.logMessage( ' Field Name {0} Missing from {1} Object  ', new List<String>{fieldLabel ,objectAPIName } , LoggingLevel.WARN);
           }
                        
        }
    }

    /**
     * 
     */
    public static void setFieldValue( SObject destinationObject,String fieldName ,String fieldType , String fieldValue ){
       
        switch on fieldType {
            when 'DATE' {		 
                if( isValidValue(fieldValue) ){
                    Date newDateValue = DateUtility.parseDate( fieldValue );
                    destinationObject.Put( fieldName,newDateValue);
                }
            }	
            when 'DATETIME' {		 
                if( isValidValue(fieldValue) ){
                    DateTime newDateValue = DateUtility.parseDateTime(fieldValue);
                    destinationObject.Put( fieldName,newDateValue);
                }
            }
            
            when 'BOOLEAN' {		 
                Boolean   booleanValue = false;
                if( isValidValue(fieldValue) ){
                     booleanValue = Boolean.valueOf(fieldValue);
                     destinationObject.Put( fieldName ,booleanValue);
                }
            }
            when 'DECIMAL' {
                Double  decimalVlaue = null;
                if( fieldValue!= '-' ){
                  decimalVlaue = Double.valueOf(fieldValue);
                }
                destinationObject.Put( fieldName ,decimalVlaue);
            }
            when 'NUMBER' {
                Integer  decimalVlaue = null;
                if( fieldValue!= '-' ){
                  decimalVlaue = Integer.valueOf(fieldValue);
                }
                destinationObject.Put( fieldName ,decimalVlaue);                
            }
            when 'CURRENCY' {		 
                Double  decimalVlaue = 0;
                if( isValidValue(fieldValue) ){
                  decimalVlaue = Double.valueOf(fieldValue);
                  destinationObject.Put( fieldName ,decimalVlaue);
                }
            }
            when  'REFERENCE' {
                if( fieldValue != null ) { 
                    if( StringUtility.isValidId(fieldValue) ){
                        destinationObject.Put( fieldName ,fieldValue);
                    }else {
                        String relationShipObject = getReferenceFieldType( ''+destinationObject.getSObjectType()  , fieldName);

                        String fieldId = findIdFromName(fieldValue, relationShipObject);
                        Logutility.logMessage(' Found Id :'+fieldId +' For  :'+fieldValue);
                        destinationObject.Put( fieldName ,fieldId );
                    }
                }
            }
            when else {		  
                    destinationObject.Put( fieldName ,fieldValue);
            } 
        }
    }

    /**
     *  Find Id From Name calc
     * 
     */
    private static String findIdFromName(String nameValue,String sobjectName){
        String returnValue = null ;
            List<Sobject> soList = Database.query('Select ID , Name from '+ String.escapeSingleQuotes(sobjectName) +' where name = :nameValue' );
            if(soList.size() == 1) {
                returnValue = (String) soList[0].get('Id');
            }
        return returnValue;
    }

    /**
     * isValid Values 
     * 
     */
    private static Boolean isValidValue(String value){
        Boolean isValid = false;
        isValid = value != null && value != '-' ;
        return isValid ;
    }
    /**
     * Based on Field Name get the Lookup Fields Object Name 
     * 
     */
    public static String getReferenceFieldType( String sObjectName , String fieldName) {
        String fieldType = null; 
        Schema.DescribeFieldResult f = Schema.getGlobalDescribe()
            .get(sObjectName)
            .getDescribe()
            .fields
            .getMap()
            .get(fieldName)
            .getDescribe();

        for(Schema.SObjectType reference : f.getReferenceTo()) {
            fieldType = reference.getDescribe().getName();
        }

        return fieldType;
    }

    /**
     * 
     */
    public class InvalidObjException extends Exception {
        
    } 
    /**
     * 
     */
    public class Record {
        public Integer rowNumber ;
        public String objectName ;
        public List<Field> objectData;
    }  
    /**
     * 
     */
    public class Field {
        public String fieldName;
        public String fieldValue;
    }
}