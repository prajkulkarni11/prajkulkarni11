/**
 * @ Author: Prajakta kulkarni 
 * @ Create Time: 2022-03-18 17:50:29
 * @ Modified by: Your name
 * @ Modified time: 2022-03-18 17:58:01
 * @ Description:Write Test Classes with 80%+ code coverage for the solution code of above questions.
//test class to add prefix to inserted contact

 */


//2.Write Test Classes with 80%+ code coverage for the solution code of above questions.
//test class to add prefix to inserted contact

@istest
public with sharing class TestUpdateContactGender {
    @istest
    public static void updateContact(){
        contact c1 = new contact();
        c1.LastName='saloni S';
        c1.Ge__c='Female';
       
        c1.Salutation='Mrs';
        insert c1;
        
        contact c2 = new contact();
        c2.LastName='ABCD';
        c2.Ge__c='male';
       
        c2.Salutation='Mr';
        insert c2;
       
              test.startTest();
        UpdateContactGender obj = new UpdateContactGender();
        
         list<contact> con= new list<contact>();
        con.add(c1);
        con.add(c2);
        
        UpdateContactGender.updateGender(con);
        test.stopTest();
        
        
        
        
    }

}