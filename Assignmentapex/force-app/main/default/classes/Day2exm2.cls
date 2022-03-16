/**

 * @File Name          : Day2em2
 * @Description        : 
 * @Author             : Girish
 * @Group              : 
 * @Last Modified By   : Girish Reddy
 * @Last Modified On   : 08/03/2022 
* @Modification Log   : 

 **/
public with sharing class Day2exm2 {
    public static void insertrecords(){
        List<Contact> cList = new list<Contact>();
        
        for(integer i=0;i<25;i++){
            Contact c = new Contact();
           c.LastName = 'Test '+i;
            cList.add(c);           
        }
        insert cList;
    }
}