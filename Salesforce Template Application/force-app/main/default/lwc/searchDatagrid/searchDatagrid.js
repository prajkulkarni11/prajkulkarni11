/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-19-2021
 * @last modified by  : Yogesh.Bhosale
**/
import { api, LightningElement, track } from 'lwc';

export default class SearchDatagrid extends LightningElement {
    @api tableData;
    @api columns;

    @track displayTableData;
    @track filteredData;
    @track searchKey;

    @track rowCount = 10;

    /**
     * 
     */
    get displayData() {
        let data = null
        this.logMessage(" displayData " + "tableData : "+ this.tableData.length )
        if(this.displayTableData && this.displayTableData.length > 0 ){
           
            data = this.filteredData ? this.filteredData : this.displayTableData;
           
            //this.logMessage(" displayData " + "data : "+ data.length + "Row Count :" +this.rowCount) ;
          return data.slice(0,this.rowCount);
        } 
        return data;
    }

    /**
     * Log message 
     * @param {*} message 
     * @param {*} who 
     * @param {*} type 
     */
    logMessage( message , who , type) {
        if( !who ){
            who =  "Search Grid" ;
        }
        if(type) {

        } else {
            console.log( "[" + who + "] :" +message);
        }
    }
    
     
    /**
     * 
     * @param {*} event 
     */
    hadleClearSearch(event){
        this.searchKey = event.target.value
        if (this.searchKey == "" ||  this.searchKey == null ){
            this.filteredData = null;
             
        }
    }

    /**
     * 
     * @param {*} event 
     * @returns 
     */
    onChangeSearch(event){
        this.searchKey = event.target.value
       
        let lowerSearchKey = this.searchKey ? this.searchKey.toLowerCase():"";
        
        const isEnterKey = event.keyCode === 13;
           if (isEnterKey) { 
                this.rowCount = 10 ;

                let localColumns = this.columns;
                this.filteredData = this.tableData.filter(function (row ) {
                    //if Any Field Mach return true                    
                    let returnValue = false;
                        //Iterate Over the Headers/Fields
                        console.log("Object Checking :"   );
                        for( let iCount = 0 ; iCount < localColumns.length ; iCount++ ){

                            let fieldName = localColumns[iCount].fieldName ? localColumns[iCount].fieldName : localColumns[iCount].label;
                            let fieldValue = row[fieldName];
                           
                            if( fieldName && fieldValue && lowerSearchKey) {

                                if ( (""+fieldValue).toLowerCase().indexOf(lowerSearchKey) != -1 ){
                                    //If Any Field Matching
                                    console.log(" \t Found Matching Field  :" + fieldName + " Value "+ fieldValue);
                                    
                                    returnValue = true;    
                                }
                            }
                        }
                    return returnValue;

                });

                this.logMessage("After Search filteredData " + "data : "+ filteredData.length ) ;                
            }
    }

    

    /**
     * Infinite Scrolling 
     */
    loadMoreData( ) {
        

        let data = null
       
        if(this.tableData && this.tableData.length > 0 ){
            data = this.filteredData ? this.filteredData : this.tableData;
        }
        if (data && data.length >= this.rowCount)
            this.rowCount += 10 ;
    }

    /**
     * Method In case want to debug number of columns 
     */
    get displayColumns(){
        this.columns.forEach(column => {
            this.logMessage( "column name : "+column.label + " fieldName : "+column.fieldName );
        });
        return this.columns;
    }

    connectedCallback() {
    	this.processMyData(this.tableData);
    }
    @api 
  	processMyData(tableData) {
      	this.displayTableData = [...tableData];
    }

    @api refresh(){
        this.logMessage("Refreshihg ...");
        this.displayTableData = [...this.tableData];
    }
} 