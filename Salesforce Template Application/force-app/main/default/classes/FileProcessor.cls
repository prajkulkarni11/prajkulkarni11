/**
 * @description       : 
 * @author            : Yogesh.Bhosale
 * @group             : 
 * @last modified on  : 12-11-2021
 * @last modified by  : Yogesh.Bhosale
**/
public with sharing class FileProcessor extends AbstractTest {

    /**
     * Process File Interacing the UI 
     * 
     */
     public static String processFile(String fileName, String recordData, String filterCriteria ) {
        String result = '';
        IFileProcessor processor = getFileProcessor(fileName);
        if (processor != null ) {
            result = processor.processFile(recordData , filterCriteria);
            if( result == null) {
                LogUtility.debug('Could not Process file :'+fileName);
            }
        }else{
            LogUtility.debug('Processor Not Available for  :' + fileName);
        }
        return result;
    }

    /**
     * Get the processor based on file names
     * 
     */
    private static IFileProcessor getFileProcessor(String fileName) {
        IFileProcessor processor = null;

        String extension = FileUtility.getFileExtension(fileName);
        LogUtility.debug( 'extension for  '+fileName + ' is '+extension); 

        if( FileUtility.isExcelExtension(extension)){
            LogUtility.debug( 'Found Processor For '+fileName + ' preparing Processor'); 
            processor = new ExcelFileProcessor(fileName);
            
        } else {
            LogUtility.debug('Extension do not Found ');   
        }
        return processor;
    }

    
   
} 
