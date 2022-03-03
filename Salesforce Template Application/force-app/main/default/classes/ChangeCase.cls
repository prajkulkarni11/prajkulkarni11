
/**
 * @File Name          : ChangeCase.cls
 * @Description        : Apex Assignment-Write an apex program, to Change the Priority as "High" for all New Case 
 * @Author             : Swapnil Thalal
 * @Group              : 
 * @Last Modified By   : Swapnil Thalal
 * @Last Modified On   : 03/03/2022, 3:40:39 pm
 * @Modification Log   : 
 
**/

public with sharing class ChangeCase {

   
    public static void ChangePriority(){

      
        List<Case> caseList = [select id, caseNumber from case where status ='new'];

      
        for(Case c: caseList){

            c.Priority= 'high';
        }

        update caseList;
    }

}