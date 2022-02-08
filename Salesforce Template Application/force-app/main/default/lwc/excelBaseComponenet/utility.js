/**
     * Create Month Start date 
     * @returns 
     */
 function getMonthStart(){
    let todaysDate = new Date();
    todaysDate.setFullYear(todaysDate.getFullYear(),todaysDate.getMonth() -1 ,1);
    return  todaysDate;
}

/**
 * 
 * @returns createand Month end Date 
 */
 function getMonthEnd(){
    let todaysDate = new Date();
    todaysDate.setFullYear(todaysDate.getFullYear(),todaysDate.getMonth()   ,0 );
    return todaysDate;
}

/**
     * convert date to String 
     * 
     * @param {*} sourceDate 
     * @returns 
     */
 function dateToString( sourceDate){
    return sourceDate.getFullYear()+'-' + padZero(sourceDate.getMonth()+1)+'-' + padZero(sourceDate.getDate());;
}
/**
 * private method to convert number to padded by 0
 * @param {*} num 
 * @returns 
 */
function padZero(num){
    return num <= 9 ? '0' + num :num;
}

/**
     * Utility method to get the value of of Column Name by passing index 1,1 will convert to A1
     * @param {*} columnNo coulmn index
     * @param {*} rowNo row Index
     * @returns 
     */
 function getExcelColumnName( columnNo , rowNo ) {
    return numberToExcelColumn(columnNo) + rowNo;
}

/**
 * 
 * @param {*Take input as number start with 1 and conver to excel Colmn Name like 
 * A , B ,C ,D,E,F,G,H,I.... AA
 * @returns 
 */
function numberToExcelColumn(num) {
    var str = '', q, r;    
    while (num > 0) {
        q = (num-1) / 26;
        r = (num-1) % 26
        num = Math.floor(q) 
        str = String.fromCharCode(65 + r) + str;
    }
    return str;
}

function excelColumnToNumber(str) {
    str = str.toUpperCase();
    let out = 0, len = str.length;
    for (let pos = 0; pos < len; pos++) {
      out += (str.charCodeAt(pos) - 64) * Math.pow(26, len - pos - 1);
    }
    return out;
  }

  /**
   * Get the Worksheet from the excelFile
   * @param {*} worksheetName 
   * @param {*} excelFile 
   * @returns 
   */
  function getWorksheet(worksheetName , excelFile){
        let worksheet = null;
        if( worksheetName && excelFile && excelFile.worksheets) {

            let worksheets = excelFile.worksheets;

            for( var worksheetNo = 0 ; worksheetNo < worksheets.length ; worksheetNo++) {
                let currentWorksheet = worksheets[ worksheetNo ];
                if(currentWorksheet.name == worksheetName ){
                    worksheet = currentWorksheet;
                    break;
                }
            }
        }
      return worksheet;
  }

  /**
   * Worksheet Headers returned 
   * @param {*} worksheetName 
   * @param {*} excelFile 
   * @returns 
   */
  function getWorksheetHeaders(worksheetName , excelFile){
    let worksheetHeaders = null;
    if( worksheetName && excelFile && excelFile.worksheets) {
        let worksheet = getWorksheet(worksheetName , excelFile);
        if(worksheet){
            worksheetHeaders = worksheet.headers;
        }
    }
    return worksheetHeaders;
  }

  const statusColumn = { id:1001, label:"",fieldName:"action" ,
                        cellAttributes: { 
                                iconName: { fieldName: 'dynamicIcon' } } 
                        , hideDefaultActions: true
                        };

  const idColumn = { id:1002, label:"Record",fieldName:"IdUrl",
                    type: 'url', 
                    typeAttributes: { 
                            label: {fieldName: 'Name'} 
                        } 
                    };

  const srrorDetails = { id:1003, label:" Error Details",fieldName:"Error Details",
                        cellAttributes: { 
                                iconName: { fieldName: 'dynamicIcon' } } 
                    };
  /**
   * Find the Worksheet and Add Column forInsert Update Status 
   * 
   * @param {*} worksheetName 
   * @param {*} excelFile 
   */
  function addStausColumnsToWorksheet(worksheetName , excelFile) {
    let worksheetHeaders = null;
    if( worksheetName && excelFile && excelFile.worksheets) {
        let worksheet = getWorksheet(worksheetName , excelFile);
        worksheetHeaders = worksheet.headers;
        if(worksheet) {
             
            let newHeaders  = [];
           
            //Add Status Column
            if( ! isColumnExist (worksheetHeaders , statusColumn) ){
                newHeaders.push(statusColumn);
            }
            //Add ID Column as well 
            if( !isColumnExist (worksheetHeaders ,idColumn ) ){
                newHeaders.push(idColumn);
            }
            if( newHeaders.length > 0 ) {
                //Add At the Begining
                worksheetHeaders.forEach(oldHeader => { newHeaders.push(oldHeader);});
                worksheet.headers = newHeaders;
            }
            
        }
    }
    
  }
  /**
   * 
   * @param {*} headers 
   * @param {*} column 
   * @returns 
   */
  function isColumnExist(worksheetHeaders , column){
      let columnExist = false;
    worksheetHeaders.forEach(element => {
        if( element.id == column.id ){
            columnExist = true ;
        }
    });

    return columnExist;
  }

/**
 * Exported Functions  
 * 
 * */  
export { getMonthStart,getMonthEnd ,
         dateToString, 
         numberToExcelColumn ,
         getExcelColumnName,
         excelColumnToNumber, 
         getWorksheet ,
         addStausColumnsToWorksheet};