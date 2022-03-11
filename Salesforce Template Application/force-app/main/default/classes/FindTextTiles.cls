/**
 * @File Name          : FindTextTiles.cls
 * @Description        : write sosl query to find name ‘Text Tiles’ in account, opportunity, lead,contacts.
 * @Author             : Amar Giram
 * @Group              : 
 * @Last Modified By   : Amar Giram
 * @Last Modified On   : 04/03/2022, 3:40:39 pm
 * @Modification Log   : 
**/
public with sharing class FindTextTiles {
    public static void findTestTilesInAccountLeadOpportunitesContact(){
        try{
            List<List<sObject>> searchList1 = [FIND 'Test Tiles' IN ALL FIELDS Returning Account(Name), Lead(Name),Opportunity(Name), Contact(Name)];
            Account[] accc = (Account[])searchList1[0];
            Lead[] leadd =(Lead[])searchList1[1];
            Opportunity[] oppoo = (Opportunity[])searchList1[2];
            Contact[] conn = (Contact[])searchList1[3];            
            for(Account acccc :accc){
                System.debug('Account Result - '+acccc.Name);
            }
            for(Lead ll :leadd){
                System.debug('Lead - '+ll.Name);
            }
            for(Opportunity oo : oppoo){
                System.debug('Oppo - '+oo.Name);
            }
            for(Contact cc :conn){
                System.debug('Contact Result - '+cc.Name);
            }
            
        }
        catch(Exception e){
            System.debug('Exception is:-'+e.getMessage());
            
        }
    }
}