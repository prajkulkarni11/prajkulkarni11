/*
 * Filename: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application\force-app\main\default\classes\Assignment_29.cls
 * Path: d:\New folder\TEST\Apex Assignment\Apex-Assignments\Salesforce Template Application
 * Created Date: Monday, March 21st 2022, 10:32:52 pm
 * Author: biswajeet
 * 
 * Copyright (c) 2022 Your Company
 */

public class Assignment_29 {

    public static void assign29(){
        list<sobject> difflist = new list<sobject>();
        lead ld = new lead();
        //ld.Name='test lead';
        Account acc = new Account();
        acc.Name = 'test Account';
        Contact con = new Contact();
        con.FirstName ='Test';
        con.LastName ='Contact';
        Opportunity opp = new Opportunity();
        opp.Name = 'test Opportunity';
        difflist.add(ld);
        difflist.add(acc);
        difflist.add(con);
        difflist.add(opp);
        insert difflist;
    }
}