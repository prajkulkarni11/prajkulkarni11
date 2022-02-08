/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 01-06-2022
 * @last modified by  : Yogesh.Bhosale
**/
import { LightningElement, track } from 'lwc';

import { loadScript ,loadStyle} from 'lightning/platformResourceLoader';
import BaseComponent from 'c/baseComponent';

import EXTERNAL_STATIC_RESOURCE from '@salesforce/resourceUrl/ApplicationResources';


import { readAsBinaryString } from './readFile';
import { getExcelColumnName ,numberToExcelColumn,excelColumnToNumber,addStausColumnsToWorksheet,getWorksheet } from './utility';
import SHEETJS_ZIP from '@salesforce/resourceUrl/sheetjs';
 
//Lables
import applicationName from '@salesforce/label/c.MigrationManager';


import processRecord from '@salesforce/apex/SObjectUtility.createSObject';
import getObjectApiName from '@salesforce/apex/SObjectUtility.getObjectNameFromLabel';


const ACTION_COLUMN = "action";
const DYNAMICICON_COLUMN = "dynamicIcon";

export default class ExcelBaseComponenet extends BaseComponent {
    @track isError;
    @track errors = null;
    @track helpMessages = [];
    
    

    labels = {
        title : applicationName,
        import : "Import",
        cancel : "Cancel",
        stopImport : "Stop Import",
        readingContent : "Reading File ",
        readingContentCompleted :" Reading File Completed"

    };

    @track selectedWorksheet;
    @track selectedObjectName = null;
    @track excelFile ;

    //Progress Counter
    @track currentRecordCount = 0;
    @track sucessRecordCount = 0;
    @track errorRecordCount = 0;
    @track progress = 20;
    @track isImportInProcess = false;
    
    uploadFileComponentCSS = EXTERNAL_STATIC_RESOURCE + '/css/fileUploader/fileUploader.css';
    fileUploadImage = EXTERNAL_STATIC_RESOURCE + '/images/uploadMultiple.svg';
    /**
     * 
     *  Read excel file in the <code> excelFile </code> and create structure like 
     * excelFile = {
     *          fileName : "FileName.xls",
     *          fileSize : "100KB",
     *          worksheets : [
     *                           {
     *                                 name : "Worksheet Name",
     *                                id: 1,
     *                                 header : ["Sr.No", "Name", "Age" ],
     *                                 rowData  [
     *                                               [{type:"Number" , header:"Sr.No" , value : "Sting Value" },
     *                                               {type:"String" , header:"NAme" , value : "Yogesh" },
     *                                               {type:"Number" , header:"age" , value : "300" } ],
     *                                 ],
     *                           }
     *                     
     *                      ] 
     * }
     **/
     readExcelFile(file) {
        this.logMessage("Processing File : " + file.name );
         this.excelFile = {
                        fileName : file.name,
                        fileType : file.type,
                        fileSize : file.size,
                        worksheetsNames : [],
                        worksheets : [],
                         
        };
        this.isAvailableForDownload = false;
        this.isError = false;
        this.setHelpMessage (this.labels.readingContent );
        Promise.resolve(file).
        then( file => {
            this.logMessage("Reading File : " + file.name );
            return readAsBinaryString(file, this.excelFile);
        }).then( blob => {
            this.uploadedFile = blob;
            this.logMessage("Reading Excel Content File : " );
            this.readExcelData(blob ,this.excelFile);
            this.isLoading = false;
            this.setHelpMessage (this.labels.readingContentCompleted );
        }).then( () => {
                this.logMessage("Reading Excel Content File : " );
               return  this.excelFile;
        }).then( () => {

            this.logMessage("Updating User interface: " );
            
            this.updateUserInterface(this.excelFile);
           
        });
         
    }
    
     
    /**
     * Final method to update Userinterface elements after loading excel File
     * 
     * @param {*} excelFile 
     * @returns 
     */
    updateUserInterface(excelFile){
        return excelFile;
    }

    

    handleStopProcess(event){
        if(this.isImportInProcess )
            this.isImportInProcess = false;
        
            this.currentRecordCount = 0;
            this.sucessRecordCount = 0;
            this.errorRecordCount = 0;
    }
    handlePauseProcess(event){
        if(this.isImportInProcess )
            this.isImportInProcess = false;
    }

    calculateProgress(start , end , completed) {
        let work = end - completed;
        this.progress = (work/end)*100;
    }
    /**
     * The help message for actions on Screen 
     * @param {*} message 
     */
    setHelpMessage(message){
        //TODO
    }
    /**
     * 
     */
    handleUploadFinished(event){
       
        
        let filesReceived =  event.detail.files;
        if( filesReceived ) {
            
             //Read excel File 
             this.uploadedFile = filesReceived[0];
             this.readExcelFile( filesReceived[0]);
            
            this.logMessage("Reading exel complete");
            
        }

    }

    /**
     * Get the Worksheet Object Name 
     * 
     * @param {*} workSheetName worksheet Name its API name populated in <code>selectedObjectName</code>
     */
    getObjectApiName(workSheetName){
         if( workSheetName ) {
                let worksheet = getWorksheet(workSheetName,this.excelFile);
                getObjectApiName({ objectLabel :workSheetName}
                            
                    ).then(result => {
                        this.selectedObjectName = result;
                        if(!result ){
                            worksheet.error = "Cant Process Worksheet '"+ workSheetName +"' as no associated Object Found ";    
                        }
                        
                    }).catch(error => {
                        worksheet.error = "Cant Process Worksheet '"+ workSheetName +"' as no associated Object Found "; 
                        this.logMessage("Cant Process Worksheet '"+workSheetName + "' as no associated Object Found ");
                    });
         }
    }
    /**
     * Handle Processing 
     * @param {*} event 
     */
     handleProcess(event){
    
        this.logMessage("Processing .....");
            //processFile(String  , String ,String worksheet ) {
             addStausColumnsToWorksheet(this.selectedWorksheet, this.excelFile );
            let worksheet = getWorksheet(this.selectedWorksheet ,this.excelFile);
            //process Data in Loop
            let workSheetData = worksheet.dataRows ;
            this.isImportInProcess = true;
            
           this.processRecordSync(workSheetData  , this.currentRecordCount);
           
             
            //this.refreshChild();
            this.logMessage("Processing Ends.")
    }

    processRecordSync(workSheetData  , rowCount){
        //Set Current Record 
        
        if ( !this.isImportInProcess ) {
            return;
        }
        
        this.currentRecordCount = rowCount;
        let  totalRecordCount =  workSheetData.length;
        
        this.percentProgress = ( rowCount)/ totalRecordCount ;
        this.percentProgress = this.percentProgress* 100;
     

         if ( rowCount < totalRecordCount  ) {
             //Process Only limited Records 

            let currentRecord =   workSheetData[rowCount];          
            let request =  this.createRequest(currentRecord , rowCount);
            processRecord({ sobjectContent :JSON.stringify(request) }
                
            ).then(result => {
                currentRecord.dynamicIcon = "standard:task2";
                this.sucessRecordCount++;
                currentRecord.action = "Inserted";
                currentRecord.Id = result.Id;
                currentRecord.IdUrl = this.sfdcBaseURL+"/"+result.Id;
                this.logMessage("Processing completed for "+rowCount);
                this.refreshChild();
                this.processRecordSync(workSheetData , rowCount+1);
            }).catch(error => {
                currentRecord.dynamicIcon = "standard:first_non_empty";
                currentRecord.action = "Error";
                this.errorRecordCount++;
                this.logMessage("Processing Ends with Error ."+error);
                this.processRecordSync(workSheetData , rowCount+1);
            });
         } else {
             //Completed the Import processing
            this.isImportInProcess = false ;
         }
    }

    createRequest(record , rowCount){
        let request = {
            rowNumber : rowCount,
            objectName :this.selectedObjectName,
            objectData : this.getObjectsField(record)
        };
        return request;
    };

  
    /**
     * Process Single Record 
     * @param {*} record 
     * @param {*} rowCount 
     */
      async processRecord( record , rowCount) {
        this.logMessage("Processing Record Number "+rowCount);
        record.action = "Insert";
         
        let request =  this.createRequest(record , rowCount);
         processRecord({ sobjectContent :JSON.stringify(request) }
                
        ).then(result => {
            record.dynamicIcon = "standard:task2";
            this.sucessRecordCount++;
            this.logMessage("Processing completed for "+rowCount);
        }).catch(error => {
            record.dynamicIcon = "standard:first_non_empty";
            record.action = "Error";
            this.errorRecordCount++;
            this.logMessage("Processing Ends with Error ."+error);
        });
        
    }

    getObjectsField(record){
        let returnArray = [];
        let objectFields =  Object.keys(record);
        objectFields.forEach( attribute  => {
                let key = attribute;
                let value = record[key];
                let field = {
                    fieldName :key.trim(),
                    fieldValue : value ? value.trim() : null
                };
                if( !(key == ACTION_COLUMN ||  key == DYNAMICICON_COLUMN ) ){
                    returnArray.push(field);
                }
                
        });

        return returnArray;
    }
    /**
     * get JSON Data so that it can be sent to Server side
     * 
     * @param {*} worksheetName 
     * @returns 
     */
    getJSONDataForWorksheet(worksheetName) {
        let activeWorksheet = null;

        this.excelFile.worksheets.forEach( worksheet => {
            if(worksheet.name == worksheetName) {
                activeWorksheet = worksheet;
            }
        })
        let worksheetData = "{ \"worksheets\" : ["+ JSON.stringify(activeWorksheet) + "]}";
         
        
        
        return worksheetData;
    }
    /**
     * Handle the Activate Tab Event to populate selectedWorksheet
     * @param {*} event 
     */
    handleOnSelectTab(event) {
        this.selectedWorksheet =  event.target.value;
        
        this.getObjectApiName(this.selectedWorksheet);
    }

    handleCancelProcess(event) { 
        this.currentRecordCount = 0;
        this.sucessRecordCount = 0 ;
        this.errorRecordCount = 0;
        this.progress = 0;
        this.isImportInProcess = false;
        this.selectedObjectName = null;
        this.selectedWorksheet =  null;
        this.excelFile =  null;

    }
    /**
     * Read excel data and make it available in worksheets 
     * @param {*} blob 
     */
    readExcelData(blob) {
        let workbook = window.XLSX.read(blob, {type: 'binary'});    
        
        if(!workbook || !workbook.Workbook) { throw new Error("Cannot read Excel File (incorrect file format?)"); }
        if(workbook.SheetNames.length < 1) { throw new Error("Excel file does not contain any sheets"); }      

        if( this.excelFile ){
            for( var worksheetNo = 0 ; worksheetNo < workbook.SheetNames.length ; worksheetNo++) {
                let workSheetName = workbook.SheetNames[ worksheetNo ];
                let worksheet = {
                    id: worksheetNo,
                    name : workSheetName,
                    error: null,
                    warning:null,
                    header : [] ,
                    rowData : [],
                    displayData :[]
                }

                let excelWorksheet = this.readExcelWorkSheet (workbook.Sheets[workSheetName] ,workSheetName );
                this.excelFile.worksheets.push(excelWorksheet);
            }
        }
    }

    /**
     * Utility method to get the Worksheet
     * @param {*} excelWorkSheet 
     * @param {*} worksheetName 
     * @returns 
     */
    readExcelWorkSheet(excelWorkSheet , worksheetName ){

        let header = this.readWorksheetHeaderRow(excelWorkSheet);
        let worksheet = {
            name : worksheetName,
            headers : header,
            dataRows : this.readWorksheeDataForUpload(excelWorkSheet ,header),
            
        };


        return worksheet;
    }

    readWorksheeDataForUpload(excelWorkSheet ,header){
         var data = [];

        let worksheet = excelWorkSheet;
        //Read after First Row
        let maxRows = this.getMaxRowCount(excelWorkSheet["!ref"]);

        for( var rowNo = 2 ; rowNo <= maxRows ;  rowNo++) {
            var record = [];
            var objectRrecord = {};
            var columnCount  = header.length;
            for( var columnNo = 0 ; columnNo < columnCount ;  columnNo++) {
                    
                    let properyName = header[columnNo]["label"] ; 
                    
                    var desiredValue = this.getCellValue(columnNo , rowNo,worksheet) ;
                    
                    if( properyName){
                        let rowData  = {"key" :properyName, "value" : desiredValue};
                        objectRrecord[properyName] = desiredValue;
                        record.push(rowData);
                    }
                        
                 }
                    //Use default process icon 
                    objectRrecord.dynamicIcon = 'utility:events';
                    objectRrecord.action = 'not Processed';
                    data.push(objectRrecord);
                 
                    
        }

        return data;
    }

    /**
     * get the cell value from Excel Worksheet 
     * 
     */
    getCellValue(column,row , worksheet){
        let cellValue ="-";
        let cellAddress =  getExcelColumnName(column + 1, row ) ;
        let desiredCell = worksheet[cellAddress];
         
        if (desiredCell) {
             cellValue = (desiredCell ? (desiredCell.w?desiredCell.w :desiredCell.v ): undefined);
        } 
        return cellValue;
    }
    /**
     * Read Excel worksheet and create worksheet Object based on header 
     * 
     * @param {*} excelWorkSheet 
     * @param {*} header 
     * @returns 
     */
     readWorksheeData(excelWorkSheet,header){
        var data = [];

        let worksheet = excelWorkSheet;
        //Read after First Row
        let maxRows = this.getMaxRowCount(excelWorkSheet["!ref"]);

        for( var rowNo = 2 ; rowNo <= maxRows ;  rowNo++) {
            var record = [];
            var objectRrecord = {};
            var columnCount  = header.length;
            for( var columnNo = 0 ; columnNo < columnCount ;  columnNo++) {
                    let properyName = header[columnNo]["label"] ; 
                    var cellAddress =  getExcelColumnName(columnNo + 1, rowNo ) ;

                    var desiredCell = worksheet[cellAddress];
                    var desiredValue ="-";
                    if (desiredCell) {
                        var desiredValue = (desiredCell ? (desiredCell.w?desiredCell.w :desiredCell.v ): undefined);
                    } 
                    if( properyName){
                        objectRrecord[properyName] = desiredValue;
                        
                        record.push(objectRrecord);
                    }
                        
                 } 

                  
                    data.push(objectRrecord);
        }

        return data;
    }

    /**
     * Check for record validity 
     * @param {*} record 
     * @returns 
     */
    isValidRecord(record) {
        let columnCount = record.length;
        if(columnCount === 0 ){
            return false;
        }
        let defaultValueCount = 0 ;
        record.forEach(cellValue => {
            if ( cellValue === "-" ){
                defaultValueCount++;
            }
        });
        
        return defaultValueCount != columnCount;
    }

    /**
     * 
     */
    isValidKeyValue(record) {
        let columnCount = record.length;
        if(columnCount === 0 ){
            return false;
        }
        let defaultValueCount = 0 ;
        record.forEach( keyValue => {
            if ( keyValue.value === "-" ){
                defaultValueCount++;
            }
        });
        
        return defaultValueCount != columnCount;
    }
    /**
     * Read  First row from excel worksheet 
     * @param {*} excelWorkSheet 
     */
    readWorksheetHeaderRow(excelWorkSheet) {
        var header = [];
         
        var dataRange = excelWorkSheet["!ref"];
        
        let colcount = this.getMaxColumnCount(dataRange) ;
        for( var columnNo = 1 ; columnNo <= colcount ;  columnNo++) {
            
            var cellAddress = getExcelColumnName(columnNo, 1 ) ;

            var desiredCell = excelWorkSheet[cellAddress];

            if (desiredCell) {
                var desiredValue = (desiredCell ? desiredCell.v : undefined);
                var dataType = this.getDataType( desiredValue );
                if( desiredValue){
                    header.push( { "id":columnNo , "label" : desiredValue ,  "fieldName": desiredValue , "type" : dataType });
                }  
            }else {
                header.push( { "id":columnNo , "label" : numberToExcelColumn(columnNo) ,  "fieldName": numberToExcelColumn(columnNo), "type" : "none" });
            }  
        }

        return header;
    }

    /**
     * 
     * @param {*} dataRange 
     * @returns 
     */
    getMaxColumnCount(dataRange){
        let columncount  = "" ;
        if(dataRange && dataRange.indexOf(":") != -1 ){
            var dataStartEnd  = dataRange.split(":");//Split A1:F8
            if(dataStartEnd.length > 1) {
                var dataEnd = dataStartEnd[1];
                var end = "";
                for(var i =0 ; i < dataEnd.length; i++){
                    if(dataEnd.charCodeAt(i) > 57   )
                    end += dataEnd.charAt(i)
                }
                columncount = end;
                
            }
            
        }
        return excelColumnToNumber(columncount) ;

    }

    getMaxRowCount(dataRange){
        let columncount  = 0 ;
        if(dataRange && dataRange.indexOf(":") != -1 ){
            var dataStartEnd  = dataRange.split(":");//Split A1:F8
            if(dataStartEnd.length > 1) {
                var dataEnd = dataStartEnd[1];
                var end = "";
                for(var i =0 ; i < dataEnd.length; i++){
                    if(dataEnd.charCodeAt(i) < 57   )
                    end += dataEnd.charAt(i)
                }
                columncount = parseInt(end);
                
            }
            
        }
        return columncount;

    }
    /**
     * Clear Errors 
     */
    clearErrors(){
        this.isError = false;
        this.errors = null ;
    }
    /**
     * Add new Error
     * @param {*} errorMessage 
     * @param {*} errorType 
     * @param {*} errorCode 
     */
    addError( errorMessage,  errorType , errorCode) {
        let errorString = errorMessage;
        if( errorMessage) {
            this.formatErrorMessage(errorMessage,  errorType , errorCode);
            if( this.errors == null ){
                this.errors =[];
            }
            //Add Error 
            if( errorString)
                this.errors.push({message : errorString,variant:errorType});
        }
    }
    /**
     * Format Error Message <<ErrorCode >> : [ErrorType] : errorMessage
     * @param {*} errorMessage 
     * @param {*} errorType 
     * @param {*} errorCode 
     */
    formatErrorMessage(errorMessage,  errorType , errorCode){
        let error = errorMessage;
        if(errorCode) {
            error =  errorCode+ " :" + errorType ? "[ "+ errorType + "] : "+errorMessage : errorMessage ;
        }else if( errorType) {
            error =   "[ "+ errorType + "] : "+errorMessage ;
        } 
        return error;
    }
    /**
     * TODO get the Data type of the cell
     * @param {*} desiredValue 
     */
    getDataType( desiredValue ){
        let dataType = "String" ;
        dataType
    }

    /**
     * Connected callback
     * 
     */
     connectedCallback(){
        this.initiise();
    } 
    /**
     * 
     * 
     */
     initiise(){
        this.loadExcelLibrary();
    }

    //local variables
    rendered = false;
    /**
     * rendered callback
     */
    renderedCallback() {
        //populate base URL
        this.sfdcBaseURL = window.location.origin;

        if (!this.rendered) {
            Promise.all([
                loadStyle(this, this.uploadFileComponentCSS)
            ]).then(() => {
                this.rendered = true;
            }).catch(error => {
                console.log("Loading error : " + error);
            });
        }

    }

    /**
     * Update Childrens to Display Data 
     */
    refreshChild(){
        
        let searchGrids = this.template.querySelectorAll('c-search-datagrid');
        if (searchGrids ) {
            searchGrids.forEach( searchGrid => {
                searchGrid.refresh();
            })
        }
        
    }
    /**
     * Apply CSS 
     * 
     */
    get fileUploadSectionClass() {
        let className ="file-upload-section big-size";
        let imageBox = this.template.querySelector(".position-image");
        if (!this.smallSize) {
            className = "file-upload-section big-size";
            if (imageBox) {
                imageBox.style.display = "";
            }
        } else {
            className = "file-upload-section small-size"
            if (imageBox) {
                imageBox.style.display = "none";
            }
        }
        return className;
    }
     /**
      * 
      * 
      * Load excel library
     */
      loadExcelLibrary(){
        loadScript(this, SHEETJS_ZIP + '/xlsx.full.min.js')
        .then(() => {
            if(!window.XLSX) {
                throw new Error('Error loading SheetJS library (XLSX undefined)');                
            }
            this.ready = true;
        })
        .catch(error => {
            this.error = error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Excel Upload: Error loading SheetJS',
                    message: error.message,
                    variant: 'error'
                })
            );
        });
    }
}