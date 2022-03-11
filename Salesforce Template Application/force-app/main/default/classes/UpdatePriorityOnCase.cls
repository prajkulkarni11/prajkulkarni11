/**
 * @File Name          : UpdatePriorityOnCase.cls
 * @Description        : Assignment 5: Write an apex program, to Change the Priority as "High" for all New Case Records. And Create a New Case Record into the object. 
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
Public with sharing Class UpdatePriorityOnCase {
    
    Public static void UpdatePriority()
    {
        List<Case>updateCaseList = new list<Case>();
        //soql query to fetch records from database
        List<Case> caseList=[select id,status,priority from Case];
        try{
            if(caseList.size()>0)
            {
                for(Case c:caseList)
                {
                    if(c.status=='new')
                    {
                        c.priority='High';
                    }
                    updateCaseList.add(c);
                }
                if(!updateCaselist.isempty())
                {
                    update updateCaseList;
                }
            }
        }
        catch(Exception e){
            system.debug('exception error :'+e.getCause());
        }
    }
    
}