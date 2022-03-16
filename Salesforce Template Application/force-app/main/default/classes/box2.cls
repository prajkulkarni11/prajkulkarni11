/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\box2.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Thursday, March 17th 2022, 12:08:59 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public class box2 {

    public void extraAcc(){
 List<Account> accList = [Select Id from Account where createdDate = Today order by CreatedDate asc];
        List<Account> accListDeletion = new list <Account>();
        if(accList.size()>10){
            for(integer i=10; i<accList.size();i++){
                accListDeletion.add(accList[i]);
            }
        }
        
        if(accListDeletion.size()>0){
            try{
                Database.Delete(accListDeletion);
            }catch(exception e){
                System.debug('Exception: '+e );
            }
        }

    }
}