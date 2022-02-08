/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class FileUtility {

    public Static String getFileExtension( String fileName){
        String strExtension = fileName.substringAfterLast('.');
        return strExtension;
    }
    
     /**
     * Return true if File is Excel File 
     */
    public static Boolean isExcelExtension(String extension){
        extension  = extension.isNumeric() ?extension :extension.toUpperCase();
        Boolean isExcel = false ;
        List<String> excelExtension = new List<String>();
        excelExtension.add('XLS');
        excelExtension.add('XLSX');
        excelExtension.add('XLSB');
        return excelExtension.contains(extension);

    }

    /**
     * Return true if File is CSV File 
     */
    public static Boolean isCsvExtension(String extension){
        extension  = extension.isNumeric() ?extension :extension.toUpperCase();
        Boolean isExcel = false ;
        List<String> extensions = new List<String>();
        extensions.add('CSV');
        return extensions.contains(extension);
    }
}
