/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\triggers\restrictDel.trigger
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Saturday, March 19th 2022, 12:26:39 am
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

trigger restrictDel on Account (before delete) {

    set<id> ides = new set<id>();
    for(account acc:trigger.old){
        ides.add(acc.id);
    }
    list<account> acclist = [select id,name,(select id,name,StageName from opportunities where stageName='Closed Won') from account where id in:ides];
     Map<id,Account> mapcc = new Map<id, Account>();
     for(account acc:acclist){
         mapcc.put(acc.Id, acc);
         }       
for(account ac:trigger.old){
    if(mapcc.get(ac.id).opportunities.size()>0){
        ac.adderror('opporyunity is associated');

}
}
}