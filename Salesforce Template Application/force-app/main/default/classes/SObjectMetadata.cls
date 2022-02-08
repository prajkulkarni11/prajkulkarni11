/**
 * @description       : Class Represent SObject Metadata structure 
 * 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-20-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class SObjectMetadata {
    public static final STRING  DATATYPE_DATE = 'DATE';
    public static final STRING  DATATYPE_DATETIME = 'DATETIME';
    public static final STRING  DATATYPE_DECIMAL = 'DOUBLE';
    public static final STRING  DATATYPE_NUMBER = 'NUMBER';
    public static final STRING  DATATYPE_CURRENCY = 'CURRENCY';
    public static final STRING  DATATYPE_BOOLEAN = 'BOOLEAN';
    public static final STRING  DATATYPE_STRING = 'STRING';
    public static final STRING  DATATYPE_REFERENCE = 'REFERENCE';

    //Basic Properties 
    private String namespace;
    private String sObjectName;
    private List<String> fields;

    //Properties 
    public Boolean isCreatable;
    public Boolean isCustom ;
    public Boolean isDeletable;
    public Boolean isFeedEnabled;
    public Boolean isSearchable;
    public Boolean isUpdateable;
    public String lable;
    public String labelPlural;

    public List<Schema.ChildRelationship> childRelationships;
    //Fields
    private Map<string ,Schema.DescribeFieldResult> fieldDescribeResultMap;
    private Map<string ,String> fieldMapLabelApi;

    /**
     * Constructor passing the sObject Name
     */
    public SObjectMetadata(String sobjectName){
        this.sobjectName = sobjectName;
        describeObject();                
    }
     
    /**
     * Describe the given SObject 
     */
    private void describeObject() {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        //Object Name here is non Case Sensitive
        Schema.SObjectType sobjectType = schemaMap.get(this.sobjectName);

        if( sobjectType != null ) {
            LogUtility.logMessage( 'SObject Found : '+sobjectType);
            Schema.DescribeSObjectResult objectDescription  = sobjectType.getDescribe();
            populateObjectProperties(objectDescription);
            this.fieldDescribeResultMap = new Map<string ,Schema.DescribeFieldResult>();
            fieldMapLabelApi = new Map<String , String>();
            populateRelationships(objectDescription);
            populateFields(objectDescription);
        } else {
            LogUtility.logMessage( 'sobject Type '+this.sobjectName +' does not Exist  ');
        }
    }

    /**
     * populate basic properties 
     */
    private void populateObjectProperties(Schema.DescribeSObjectResult objectDescription){
        this.isCreatable = objectDescription.isCreateable();
        this.isCustom = objectDescription.isCustom();
        this.isDeletable = objectDescription.isDeletable();
        this.isFeedEnabled = objectDescription.isFeedEnabled();
        this.isSearchable = objectDescription.isSearchable();
        this.isUpdateable = objectDescription.isUpdateable();
        this.lable = objectDescription.getLabel();
        this.labelPlural = objectDescription.getLabelPlural();
    }

    /**
     * populate All Fields 
     * 
     */
    private void populateFields(Schema.DescribeSObjectResult objectDescription){
        
        Map<String, Schema.SObjectField> fieldMap = objectDescription.fields.getMap();
        for(String fieldName : fieldMap.keyset() ) {
            // This will give you the api name of the field name.
            Schema.SObjectField filedObject = fieldMap.get(fieldName);

             fieldName = fieldName.toUppercase(); 
             
            //Add Field Details 
            Schema.DescribeFieldResult fieldDescribeResult = fieldMap.get(fieldName).getDescribe();
            String fieldLabel =   fieldDescribeResult.getLabel().toUpperCase();
            //Update Map
            this.fieldMapLabelApi.put(fieldLabel ,fieldName ); 
            this.fieldDescribeResultMap.put(fieldName , fieldDescribeResult);
        }
    }
    /**
     * TODO : Populate all Relationships 
     */
    private void populateRelationships(Schema.DescribeSObjectResult objectDescription){
    }
    
    /**
     * get the Field Api Name 
     * 
     */
    public String getFieldApiNameFromLabel(String fieldLabel){
        String fieldApiName = null;
        if( fieldLabel != null ){
            fieldApiName = this.fieldMapLabelApi.get(fieldLabel.toUppercase());
        }
        return fieldApiName;
    }

    public String getField(String fieldName){
        String fieldApiName = null;
        if( fieldName != null ) {
            
            for( String fieldLable : this.fieldMapLabelApi.keySet()){
                String currentField = this.fieldMapLabelApi.get(fieldLable);
                if ( fieldName.toUpperCase() == currentField){
                    fieldApiName = fieldName;
                }
            }
        }
        return fieldApiName;
    }

    /**
     * 
     */
    public String getFieldType(String fieldName){
        String fieldType = null;
        fieldName = fieldName.toUpperCase();
        Schema.DescribeFieldResult fieldDescribeResult = this.fieldDescribeResultMap.get(fieldName);
        if( fieldDescribeResult!= null ) {
            Schema.DisplayType displayType = fieldDescribeResult.getType();

            if(displayType == Schema.DisplayType.DATE){
                fieldType = DATATYPE_DATE ;
            } else if(displayType == Schema.DisplayType.DATETIME){
                fieldType = DATATYPE_DATETIME;
            } else if(displayType == Schema.DisplayType.DOUBLE || 
                        displayType == Schema.DisplayType.PERCENT || 
                        displayType == Schema.DisplayType.INTEGER){
                fieldType = DATATYPE_NUMBER;
            } else if(displayType == Schema.DisplayType.CURRENCY ){
                fieldType = DATATYPE_CURRENCY ;
            } else if(displayType == Schema.DisplayType.BOOLEAN ){
                fieldType = DATATYPE_BOOLEAN ;                 
            }else if(displayType == Schema.DisplayType.REFERENCE ){
                fieldType = DATATYPE_REFERENCE ;    
            } else if(displayType == Schema.DisplayType.ADDRESS || 
                    displayType == Schema.DisplayType.STRING || 
                    displayType == Schema.DisplayType.PHONE ||
                    displayType == Schema.DisplayType.TEXTAREA ||
                    displayType == Schema.DisplayType.ANYTYPE ||
                    displayType == Schema.DisplayType.COMBOBOX ||
                    displayType == Schema.DisplayType.EMAIL ||
                    displayType == Schema.DisplayType.MULTIPICKLIST ||
                    displayType == Schema.DisplayType.PHONE ||
                    displayType == Schema.DisplayType.URL ||
                    displayType == Schema.DisplayType.PICKLIST){
                fieldType = DATATYPE_STRING ;
            }
        }
        
        
        return fieldType;
    }

}
