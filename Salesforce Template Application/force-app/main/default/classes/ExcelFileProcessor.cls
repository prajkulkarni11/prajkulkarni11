/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-09-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class ExcelFileProcessor Implements IFileProcessor {

    private String fileName ; 

    public ExcelFileProcessor(String fileName){
            this.fileName = fileName;
    }
    /**
     * Process Excel Data in the json Format and Filtercriteria represents the worksheets 
     * 
     */
    public String processFile(String data , String filterCriteria ){
        String result = '';
        
        String worksheetName = filterCriteria;
        LogUtility.logMessage('StartProcessing Worksheet : '+worksheetName + ' from File ' + this.fileName );
        ExcelData sourceData  = (ExcelData)JSON.deserialize(data, ExcelData.class);

        //Get the Worksheet Name to be processed
        String worksheetApiName = null;
        if( worksheetName != null ) { 
            worksheetApiName = SObjectUtility.getObjectNameFromLabel(worksheetName);
            LogUtility.logMessage('Processing Worksheet :'+worksheetName +' for Object ' +worksheetApiName);
        } else {
            LogUtility.logMessage('Cant process worksheet as no Associated API for '+worksheetName , LoggingLevel.WARN);
            return result;
        }

        // //Get worksheet Data 
        // Worksheet  worksheetData = getWorksheetData(sourceData,worksheetName);
        
        // //Process Data and Create Salesforce Objects 
        // List<SObject> rows = processWorksheet(worksheetData );
        // List<String> externalColumns = getExterlIDColumns(worksheetData);
        // //Insert update the Object and create Resoponce 
        // result = processSobjects(rows,worksheetName ,externalColumns);
         
         return result;
    }

    /**
     * Internal structure to read content of File 
     * 
     */

    public class ExcelData {
        public List<Worksheet> worksheets;
    }

    public class Worksheet {
        public String name;
        public List<String> headers;
        public List<List<Rowdata>> dataRows;
        public String databaseObjectName;
    }

    public class Header {
        public String label;
        public String fieldName;
        
    }

    public class RowData {
        public String key ;
        public String value;
        
    }
    public class Response {
        public Integer rowNumber ;
        public Id newId ;
        public Boolean isSuccess;
        public Boolean isError;
        Public List<String> errors;
    }    
}
